package it.yourstore.commons.utilities;

public class Constants {
	private Constants() {
		throw new IllegalStateException("Utility class");
	}

	public static final String ROWIDFIELDDELIMITER = "~";
	public static final String CORRELATION_KEY = "X-Correlation-ID";
}

