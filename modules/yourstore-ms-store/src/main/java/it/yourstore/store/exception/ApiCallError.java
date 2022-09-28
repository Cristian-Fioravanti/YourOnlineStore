package it.yourstore.store.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApiCallError {
	private int status; // HTTP STATUS CODE
	private String reasonPhrase; // HTTP STATUS REASON PHRASE
	private String code; // UNIQUE CODE IDENTIFIYNG ERROR ON THE SYSTEM
	private String message; // BREAF ERROR DESCRIPTION
	private String instance; // PATH

	public ApiCallError(String reasonPhrase, String message) {
		this.reasonPhrase = reasonPhrase;
		this.message = message;
	}

	public ApiCallError(String reasonPhrase, List<Map<String, String>> details) {
		this.reasonPhrase = reasonPhrase;
		this.message = "[";

		details.forEach(detail -> {
			this.message += convertWithStream(detail);
		});

		this.message += "]";
	}

	public ApiCallError(String reasonPhrase, Map<String, String> detail) {
		this.reasonPhrase = reasonPhrase;
		this.message += convertWithStream(detail);
	}

	public static String convertWithStream(Map<String, String> map) {
		String mapAsString = map.keySet().stream().map(key -> key + " = " + map.get(key))
				.collect(Collectors.joining(", ", "{ ", " }"));
		return mapAsString;
	}
}
