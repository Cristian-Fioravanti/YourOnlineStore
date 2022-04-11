
package it.yourstore.commons.utilities;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;

import net.sf.jasperreports.engine.JasperReport;

@Component
public class JasperReportsCache {
	private Map<String, JasperReport> cache;

	public JasperReportsCache() {
		cache = new ConcurrentHashMap<String, JasperReport>();
	}

	public void save(String key, JasperReport jasperReport) {
		cache.put(key, jasperReport);
	}

	public JasperReport load(String key) {
		return cache.get(key);
	}

	public boolean isSaved(String key) {
		return cache.containsKey(key);
	}
}

