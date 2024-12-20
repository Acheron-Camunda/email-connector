package com.acheron.connectors.email.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import com.acheron.connectors.email.model.request.EmailRequestData;
import com.acheron.connectors.email.model.response.EmailResponse;
import com.acheron.connectors.email.model.response.Response;

import freemarker.cache.FileTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.sesv2.SesV2Client;
import software.amazon.awssdk.services.sesv2.model.Destination;
import software.amazon.awssdk.services.sesv2.model.EmailContent;
import software.amazon.awssdk.services.sesv2.model.SendEmailRequest;
import software.amazon.awssdk.services.sesv2.model.SesV2Exception;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Service class to handle sending emails using FreeMarker and SES templates. Provides
 * support for dynamic data binding and email customization.
 * 
 * Concrete implementation of the `EmailRequestData` interface. Handles email
 * sending using FreeMarker and Amazon SES templates.
 * 
 * @author HariharanB
 */
public class SendEmail implements EmailRequestData {
	private static final Logger LOGGER = LoggerFactory.getLogger(SendEmail.class);

	private List<String> receiverEmail;
	private String sesReceiverEmail;
	private String sesSenderEmail;
	private String sesTemplateName;
	private String senderName;
	private Map<String, Object> dynamicData;
	private String templatePath;
	private List<String> cc;
	private List<String> bcc;
	private String subject;
	private JavaMailSender mailSender;
	private Configuration freemarkerConfig;

	private static final String USERNAME = System.getenv("EMAIL_USERNAME").strip();
	private static final String PASSWORD = System.getenv("EMAIL_PASSWORD").strip();
	private static final String HOST = System.getenv("EMAIL_HOST").strip();
	private static final int PORT = Integer.parseInt(System.getenv("EMAIL_PORT"));
	private static SesV2Client sesv2Client = null;

	/**
	 * Constructor that initializes the email sender and FreeMarker configuration.
	 *
	 * @throws IOException if there's an error in configuration setup
	 */
	public SendEmail() throws IOException {
		this.mailSender = initializeMailSender();
		this.freemarkerConfig = initializeFreemarkerConfig();
		Region region = Region.US_EAST_2;
		sesv2Client = SesV2Client.builder().region(region).build();
		LOGGER.debug("SendEmail instance created with initialized configurations.");

	}

	/**
	 * Initializes the JavaMailSender for sending emails.
	 *
	 * @return the configured JavaMailSender instance
	 */
	private JavaMailSender initializeMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

		mailSender.setHost(HOST);
		mailSender.setPort(PORT);
		mailSender.setUsername(USERNAME);
		mailSender.setPassword(PASSWORD);

		Properties props = mailSender.getJavaMailProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		LOGGER.debug("JavaMailSender initialized with host: {}", mailSender.getHost());

		return mailSender;
	}

	/**
	 * Initializes the FreeMarker configuration for processing templates.
	 *
	 * @return the configured FreeMarker `Configuration` instance
	 * @throws IOException if an error occurs during configuration setup
	 */
	private Configuration initializeFreemarkerConfig() throws IOException {
		Configuration config = new Configuration(Configuration.VERSION_2_3_33);
		config.setDefaultEncoding("UTF-8");
		config.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		config.setLogTemplateExceptions(false);
		config.setWrapUncheckedExceptions(true);
		LOGGER.debug("FreeMarker configuration initialized.");
		return config;
	}

	/**
	 * Configures the template loader for FreeMarker using the provided path.
	 *
	 * @param freemarkerConfig the FreeMarker configuration instance
	 * @param templatePath     the path to the directory containing the templates
	 * @throws IOException if an error occurs during template loader setup
	 */
	public static void setTemplateLoaderFromPath(Configuration freemarkerConfig, String templatePath)
			throws IOException {
		FileTemplateLoader templateLoader = new FileTemplateLoader(new File(templatePath));
		freemarkerConfig.setTemplateLoader(templateLoader);
		LOGGER.debug("Template loader set with path: {}", templatePath);

	}

	/**
	 * Executes the email sending operation using the provided data and template.
	 *
	 * @return a `Response` object encapsulating the operation result
	 */
	@Override
	public EmailResponse invokeCut() {
		LOGGER.info("Executing email send operation...");
		String response = null;

		try {
			// For the SES
			if (sesReceiverEmail != null && sesSenderEmail != null && sesTemplateName != null) {
				Destination destination = Destination.builder().toAddresses(sesReceiverEmail).build();

				ObjectMapper objectMapper = new ObjectMapper();
				String jsonString = objectMapper.writeValueAsString(dynamicData);
				LOGGER.info("Dynamic Data: {}", jsonString);

				software.amazon.awssdk.services.sesv2.model.Template myTemplate = software.amazon.awssdk.services.sesv2.model.Template
						.builder().templateName(sesTemplateName).templateData(jsonString).build();

				EmailContent emailContent = EmailContent.builder().template(myTemplate).build();

				SendEmailRequest emailRequest = SendEmailRequest.builder().destination(destination)
						.content(emailContent).fromEmailAddress(sesSenderEmail).build();

				LOGGER.info("Attempting to send an email based on a template using the AWS SDK for Java (v2)...");
				sesv2Client.sendEmail(emailRequest);
				LOGGER.info("Email based on template was sent");
				response = "Email sent successfully!";

			} else {
				// Create email message
				MimeMessage mimeMessage = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

				helper.setFrom("email.acheroncamunda@gmail.com", senderName);
				helper.setTo(receiverEmail.toArray(new String[0]));
				helper.setSubject(subject);

				if (cc != null && !cc.isEmpty()) {
					helper.setCc(cc.toArray(new String[0]));
				}

				if (bcc != null && !bcc.isEmpty()) {
					helper.setBcc(bcc.toArray(new String[0]));
				}

				String fullTemplatePath = templatePath; // Full path including template name
				String templateDirectory = fullTemplatePath.substring(0, fullTemplatePath.lastIndexOf('/'));
				String templateName = fullTemplatePath.substring(fullTemplatePath.lastIndexOf('/') + 1);

				setTemplateLoaderFromPath(freemarkerConfig, templateDirectory);

				// Process the template and populate data
				Template template = freemarkerConfig.getTemplate(templateName);
				String htmlContent = FreeMarkerTemplateUtils.processTemplateIntoString(template, dynamicData);

				helper.setText(htmlContent, true);

				// Send email
				mailSender.send(mimeMessage);
				LOGGER.info("Email sent successfully to recipients: {}", receiverEmail);

				response = "Email sent successfully!";
			}


		} catch (MessagingException | IOException | freemarker.template.TemplateException e) {
			LOGGER.error("Error occurred while sending email: {}", e.getMessage(), e);
			response = "Error while sending email.";
		} catch (SesV2Exception e) {
			LOGGER.error("Failed to send email: {}", e.awsErrorDetails().errorMessage());
		}
		return new Response<>(response);
	}

	public List<String> getReceiverEmail() {
		return receiverEmail;
	}

	public void setReceiverEmail(List<String> receiverEmail) {
		this.receiverEmail = receiverEmail;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public Map<String, Object> getDynamicData() {
		return dynamicData;
	}

	public void setDynamicData(Map<String, Object> dynamicData) {
		this.dynamicData = dynamicData;
	}

	public String getTemplatePath() {
		return templatePath;
	}

	public void setTemplatePath(String templatePath) {
		this.templatePath = templatePath;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public List<String> getCc() {
		return cc;
	}

	public void setCc(List<String> cc) {
		this.cc = cc;
	}

	public List<String> getBcc() {
		return bcc;
	}

	public void setBcc(List<String> bcc) {
		this.bcc = bcc;
	}

	public String getSesReceiverEmail() {
		return sesReceiverEmail;
	}

	public void setSesReceiverEmail(String sesReceiverEmail) {
		this.sesReceiverEmail = sesReceiverEmail;
	}

	public String getSesSenderEmail() {
		return sesSenderEmail;
	}

	public void setSesSenderEmail(String sesSenderEmail) {
		this.sesSenderEmail = sesSenderEmail;
	}

	public String getSesTemplateName() {
		return sesTemplateName;
	}

	public void setSesTemplateName(String sesTemplateName) {
		this.sesTemplateName = sesTemplateName;
	}

	@Override
	public String toString() {
		return "SendEmail [receiverEmail=" + receiverEmail + ", sesReceiverEmail=" + sesReceiverEmail
				+ ", sesSenderEmail=" + sesSenderEmail + ", sesTemplateName=" + sesTemplateName + ", senderName="
				+ senderName + ", dynamicData=" + dynamicData + ", templatePath=" + templatePath + ", cc=" + cc
				+ ", bcc=" + bcc + ", subject=" + subject + ", mailSender=" + mailSender + ", freemarkerConfig="
				+ freemarkerConfig + "]";
	}

}
