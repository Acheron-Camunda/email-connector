package com.acheron.connectors.email;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.acheron.connectors.email.model.request.EmailRequest;
import com.google.gson.Gson;

import io.camunda.connector.api.annotation.OutboundConnector;
import io.camunda.connector.api.outbound.OutboundConnectorContext;
import io.camunda.connector.api.outbound.OutboundConnectorFunction;

/**
 * Outbound connector function for email template operations with freemarker and Amazon SES. Handles
 * execution of email tasks within a Camunda process workflow.
 * 
 * @author HariharanB
 */
@OutboundConnector(name = "Email Tempalte", inputVariables = { "operation",
		"data" }, type = "com.acheron.camunda.connectors.email.template:1")
public class EmailConnectorFunction implements OutboundConnectorFunction {
	private static final Logger LOGGER = LoggerFactory.getLogger(EmailConnectorFunction.class);
	private final Gson gson;

	/**
	 * Default constructor using the default `Gson` instance.
	 */
	public EmailConnectorFunction() {
		this(GsonSupplier.getGson());
	}

	/**
	 * Constructor to allow custom `Gson` injection.
	 *
	 * @param gson the `Gson` instance to use
	 */
	public EmailConnectorFunction(Gson gson) {
		this.gson = gson;
	}

	/**
	 * Executes the email operation defined in the process flow. Parses input JSON,
	 * creates an appropriate `EmailRequest`, and invokes the operation.
	 *
	 * @param outboundConnectorContext the context of the outbound connector
	 * @return the result of the email operation
	 * @throws Exception if an error occurs during execution
	 */
	@Override
	public Object execute(OutboundConnectorContext outboundConnectorContext) throws Exception {
		LOGGER.debug("Executing FreemarkerConnectorFunction...");

		String variables = outboundConnectorContext.getJobContext().getVariables();
		LOGGER.debug("Received input variables: {}", variables);

		final var emailRequest = gson.fromJson(variables, EmailRequest.class);
		LOGGER.debug("Parsed EmailRequest: {}", emailRequest);

		Object response = emailRequest.invoke();
		LOGGER.debug("Email operation completed with response: {}", response);

		return response;
		
	}
}