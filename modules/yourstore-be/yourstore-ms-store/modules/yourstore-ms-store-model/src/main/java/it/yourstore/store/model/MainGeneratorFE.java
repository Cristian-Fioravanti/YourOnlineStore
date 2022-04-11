package it.yourstore.store.model;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;

import it.mice.voila2.acceleogenerator.core.Main;

/**
 * Entry point of the 'Main' generation module.
 *
 * @generated
 */
public class MainGeneratorFE extends Main {
	/**
	 * The name of the module.
	 *
	 * @generated
	 */
	public static final String MODULE_FILE_NAME = "/it/yourstore/store/model/mainFE";

	/**
	 * The name of the templates that are to be generated.
	 *
	 * @generated
	 */
	public static final String[] TEMPLATE_NAMES = { "mainClassFE" };

	/**
	 * The list of properties files from the launch parameters (Launch
	 * configuration).
	 *
	 * @generated
	 */
	private List<String> propertiesFiles = new ArrayList<String>();

	/**
	 * Allows the public constructor to be used. Note that a generator created this
	 * way cannot be used to launch generations before one of
	 * {@link #initialize(EObject, File, List)} or
	 * {@link #initialize(URI, File, List)} is called.
	 * <p>
	 * The main reason for this constructor is to allow clients of this generation
	 * to call it from another Java file, as it allows for the retrieval of
	 * {@link #getProperties()} and {@link #getGenerationListeners()}.
	 * </p>
	 *
	 * @generated
	 */
	public MainGeneratorFE() {
		// Empty implementation
	}

	/**
	 * This allows clients to instantiates a generator with all required
	 * information.
	 * 
	 * @param modelURI     URI where the model on which this generator will be used
	 *                     is located.
	 * @param targetFolder This will be used as the output folder for this
	 *                     generation : it will be the base path against which all
	 *                     file block URLs will be resolved.
	 * @param arguments    If the template which will be called requires more than
	 *                     one argument taken from the model, pass them here.
	 * @throws IOException This can be thrown in three scenarios : the module cannot
	 *                     be found, it cannot be loaded, or the model cannot be
	 *                     loaded.
	 * @generated
	 */
	public MainGeneratorFE(URI modelURI, File targetFolder, List<? extends Object> arguments) throws IOException {
		initialize(modelURI, targetFolder, arguments);
	}

	/**
	 * This allows clients to instantiates a generator with all required
	 * information.
	 * 
	 * @param model        We'll iterate over the content of this element to find
	 *                     Objects matching the first parameter of the template we
	 *                     need to call.
	 * @param targetFolder This will be used as the output folder for this
	 *                     generation : it will be the base path against which all
	 *                     file block URLs will be resolved.
	 * @param arguments    If the template which will be called requires more than
	 *                     one argument taken from the model, pass them here.
	 * @throws IOException This can be thrown in two scenarios : the module cannot
	 *                     be found, or it cannot be loaded.
	 * @generated
	 */
	public MainGeneratorFE(EObject model, File targetFolder, List<? extends Object> arguments) throws IOException {
		initialize(model, targetFolder, arguments);
	}

	/**
	 * This will be called in order to find and load the module that will be
	 * launched through this launcher. We expect this name not to contain file
	 * extension, and the module to be located beside the launcher.
	 * 
	 * @return The name of the module that is to be launched.
	 * @generated
	 */
	@Override
	public String getModuleName() {
		return MODULE_FILE_NAME;
	}

	/**
	 * If the module(s) called by this launcher require properties files, return
	 * their qualified path from here.Take note that the first added properties
	 * files will take precedence over subsequent ones if they contain conflicting
	 * keys.
	 * 
	 * @return The list of properties file we need to add to the generation context.
	 * @see java.util.ResourceBundle#getBundle(String)
	 * @generated NOT
	 */
	@Override
	public List<String> getProperties() {
		/*
		 * If you want to change the content of this method, do NOT forget to change the
		 * "@generated" tag in the Javadoc of this method to "@generated NOT". Without
		 * this new tag, any compilation of the Acceleo module with the main template
		 * that has caused the creation of this class will revert your modifications.
		 */

		/*
		 * TODO if your generation module requires access to properties files, add their
		 * qualified path to the list here.
		 * 
		 * Properties files can be located in an Eclipse plug-in or in the file system
		 * (all Acceleo projects are Eclipse plug-in). In order to use properties files
		 * located in an Eclipse plugin, you need to add the path of the properties
		 * files to the "propertiesFiles" list:
		 * 
		 * final String prefix = "platform:/plugin/"; final String pluginName =
		 * "org.eclipse.acceleo.module.sample"; final String packagePath =
		 * "/org/eclipse/acceleo/module/sample/properties/"; final String fileName =
		 * "default.properties"; propertiesFiles.add(prefix + pluginName + packagePath +
		 * fileName);
		 * 
		 * With this mechanism, you can load properties files from your plugin or from
		 * another plugin.
		 * 
		 * You may want to load properties files from the file system, for that you need
		 * to add the absolute path of the file:
		 * 
		 * propertiesFiles.add("C:\Users\MyName\MyFile.properties");
		 * 
		 * If you want to let your users add properties files located in the same folder
		 * as the model:
		 *
		 * if (EMFPlugin.IS_ECLIPSE_RUNNING && model != null && model.eResource() !=
		 * null) {
		 * propertiesFiles.addAll(AcceleoEngineUtils.getPropertiesFilesNearModel(model.
		 * eResource())); }
		 * 
		 * To learn more about Properties Files, have a look at the Acceleo
		 * documentation (Help -> Help Contents).
		 */
		URL uri = Thread.currentThread().getContextClassLoader().getResource("properties/voila2-default.properties");
		String resName = uri.toExternalForm().substring(6);
		propertiesFiles.add(resName);
		return propertiesFiles;
	}

	/**
	 * This will be used to get the list of templates that are to be launched by
	 * this launcher.
	 * 
	 * @return The list of templates to call on the module {@link #getModuleName()}.
	 * @generated
	 */
	@Override
	public String[] getTemplateNames() {
		return TEMPLATE_NAMES;
	}
}

