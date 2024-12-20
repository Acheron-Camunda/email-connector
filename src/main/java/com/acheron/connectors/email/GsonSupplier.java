package com.acheron.connectors.email;

import java.util.TimeZone;

import com.acheron.connectors.email.model.request.EmailRequest;
import com.acheron.connectors.email.service.SendEmail;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Supplies a configured `Gson` instance for use across the application.
 * Includes custom deserializers and type adapters.
 * 
 * @author HariharanB
 */
public class GsonSupplier {
	private static final EmailRequestDeserializer DESERIALIZER = new EmailRequestDeserializer("operation")
			.registerType("freemarker.send-email", SendEmail.class).registerType("ses.send-email", SendEmail.class);

	private static final Gson GSON = new GsonBuilder().registerTypeAdapter(EmailRequest.class, DESERIALIZER)
			.registerTypeAdapter(TimeZone.class, new TimeZoneAdapter()).create();

	private GsonSupplier() {
	}

	/**
	 * Provides the configured `Gson` instance.
	 *
	 * @return a `Gson` instance with custom deserializers and adapters
	 */
	public static Gson getGson() {
		return GSON;
	}
}
