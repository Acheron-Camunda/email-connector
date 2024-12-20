package com.acheron.connectors.email.model.response;

import java.util.Objects;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Generic implementation of the `EmailResponse` interface. Encapsulates the
 * response data from an email operation.
 *
 * @param <T> the type of the response data
 * 
 * @author HariharanB
 */
public class Response<T> implements EmailResponse {
	private static final Logger LOGGER = LoggerFactory.getLogger(Response.class);

	private final T response;

	/**
	 * Constructs a new Response with the specified data.
	 *
	 * @param response the response data
	 */
	public Response(T response) {
		super();
        LOGGER.debug("Response object created with data: {}", response);
		this.response = response;
	}

	@Override
	public int hashCode() {
		return Objects.hash(response);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Response<?> other = (Response<?>) obj;
		return Objects.equals(response, other.response);
	}
	 /**
     * Retrieves the response data.
     *
     * @return the response data
     */
	public T getResponse() {
		return response;
	}

	@Override
	public String toString() {
		return "Response [response=" + response + "]";
	}

}
