package com.acheron.connectors.email;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.acheron.connectors.email.model.request.EmailRequest;
import com.acheron.connectors.email.model.request.EmailRequestData;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;

/**
 * Custom deserializer for `EmailRequest` objects. Determines the type of the
 * request based on a discriminator field in the JSON and deserializes it into
 * the appropriate class.
 * 
 * @author HariharanB
 */
public class EmailRequestDeserializer implements JsonDeserializer<EmailRequest<?>> {
	private static final Logger LOGGER = LoggerFactory.getLogger(EmailRequestDeserializer.class);

	private final String discriminatorField;
	private final Map<String, Class<? extends EmailRequestData>> registeredTypes = new HashMap<>();

	/**
	 * Constructor to initialize the discriminator field used to identify the type
	 * of request.
	 *
	 * @param discriminatorField the field name in the JSON that determines the type
	 *                           of request
	 */
	public EmailRequestDeserializer(String discriminatorField) {
		this.discriminatorField = discriminatorField;
	}

	/**
	 * Registers a new type of request that this deserializer can handle.
	 *
	 * @param operation the identifier for the type
	 * @param type      the class of the request data
	 * @return the deserializer instance for chaining
	 */
	public EmailRequestDeserializer registerType(String operation, Class<? extends EmailRequestData> type) {
		registeredTypes.put(operation, type);
		LOGGER.debug("Registered operation type: {}", operation);
		return this;
	}

	@Override
	public EmailRequest<?> deserialize(JsonElement jsonElement, java.lang.reflect.Type typeOfT,
			JsonDeserializationContext context) throws JsonParseException {

		JsonObject jsonObject = jsonElement.getAsJsonObject();
		JsonElement operationElement = jsonObject.get(discriminatorField);

		if (operationElement == null) {
			LOGGER.error("Missing operation field in EmailRequest JSON.");
			throw new JsonParseException("Missing operation field in EmailRequest JSON.");
		}

		String operation = operationElement.getAsString();
		LOGGER.debug("Deserializing EmailRequest with operation: {}", operation);

		Class<? extends EmailRequestData> dataType = registeredTypes.get(operation);

		if (dataType == null) {
			LOGGER.error("Unknown operation type: {}", operation);
			throw new JsonParseException("Unknown operation type: " + operation);
		}

		EmailRequestData data = context.deserialize(jsonObject.get("data"), dataType);
		EmailRequest<EmailRequestData> emailRequest = new EmailRequest<>();
		emailRequest.setOperation(operation);
		emailRequest.setData(data);

		LOGGER.debug("Successfully deserialized EmailRequest with operation: {}", operation);
		return emailRequest;
	}
}
