package it.yourstore.store.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternUtils;

import org.springframework.stereotype.Service;

import it.yourstore.commons.utilities.JasperReportsCache;
import it.micegroup.voila2runtime.exception.BusinessException;
import net.sf.jasperreports.engine.JRException;
import java.io.IOException;

import java.io.ByteArrayOutputStream;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.Exporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleXlsxReportConfiguration;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;

/**
 * Generic class for services
 */
@Service
public class BaseServiceImpl {
	private static String JASPER_REPORT_EXTENSION = ".jrxml";
	private static String JASPER_REPORT_MAIN_PREFIX = "Detail";

	@Value("${jasperreports.dir}")
	protected String jasperReportsDir;

	@Autowired
	private ResourceLoader resourceLoader;

	@Value("${jasperreports.debug}")
	private Boolean jasperReportsDebug;

	@Autowired
	private JasperReportsCache jasperReportsCache;

	protected JasperReport prepareJasperReport(String reportName, Map<String, Object> parameters)
			throws BusinessException {
		String jrMainKey = reportName;
		String jrMainFilename = jrMainKey + JASPER_REPORT_EXTENSION;
		try {
			// Find and build all dependency resources except the main (also know as master
			// report).
			ResourcePatternResolver resourcePatternResolver = ResourcePatternUtils
					.getResourcePatternResolver(resourceLoader);
			Resource[] jrResources = resourcePatternResolver
					.getResources("classpath:" + jasperReportsDir + "/*" + reportName + JASPER_REPORT_EXTENSION);
			Resource jrMainResource = null;
			for (Resource resource : jrResources) {
				if (resource.getFilename().equals(jrMainFilename)) {
					// Save main report resource (file) and jump the build.
					jrMainResource = resource;
					continue;
				}
				String jrKey = resource.getFilename().replaceFirst(JASPER_REPORT_EXTENSION, "");
				if (jasperReportsDebug || !jasperReportsCache.isSaved(jrKey)) {
					jasperReportsCache.save(jrKey, JasperCompileManager.compileReport(resource.getInputStream()));
				}
				parameters.put(jrKey, jasperReportsCache.load(jrKey));
			}
			// Check if main report exist.
			if (jrMainResource == null) {
				throw new RuntimeException(jrMainFilename + " not found");
			}
			// Compile and return the main report.
			if (jasperReportsDebug || !jasperReportsCache.isSaved(jrMainKey)) {
				jasperReportsCache.save(jrMainKey, JasperCompileManager.compileReport(jrMainResource.getInputStream()));
			}
			return jasperReportsCache.load(jrMainKey);
		} catch (IOException e) {
			throw new BusinessException(e);
		} catch (JRException j) {
			throw new BusinessException(j);
		}
	}

	protected ByteArrayOutputStream exportXlsReport(JasperPrint jasperPrint) throws JRException {
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();

		SimpleXlsxReportConfiguration configuration = new SimpleXlsxReportConfiguration();
		configuration.setOnePagePerSheet(true);
		configuration.setIgnoreGraphics(false);

		Exporter exporter = new JRXlsxExporter();
		exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
		exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(byteArrayOutputStream));
		exporter.setConfiguration(configuration);
		exporter.exportReport();

		return byteArrayOutputStream;
	}
}
