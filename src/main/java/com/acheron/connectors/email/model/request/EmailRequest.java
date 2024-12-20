package com.acheron.connectors.email.model.request;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.acheron.connectors.email.model.response.EmailResponse;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

/**
 * Generic model class for email requests.
 *
 * @param <T> the type of the request data
 * 
 * @author HariharanB
 */
public class EmailRequest<T extends EmailRequestData> {
    private static final Logger LOGGER = LoggerFactory.getLogger(EmailRequest.class);

	@NotBlank
	private String operation;
	@Valid
	@NotNull
	private T data;

	/**
	 * Invokes the email operation based on the data provided.
	 *
	 * @return the response of the operation
	 */
	public EmailResponse invoke() {
		LOGGER.debug("Invoking EmailRequest with operation: {}", operation);
		return data.invokeCut();
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "EmailRequest [operation=" + operation + ", data=" + data + "]";
	}
}