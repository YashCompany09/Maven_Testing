This project was created from the archetype "wildfly-subsystem-archetype".

Documentation on Subsystems can be found here: https://docs.wildfly.org/26/Extending_WildFly.html

To deploy it:

Step 1:
Register the extension in "standalone.xml" and add the subsystem configuration:

    <extensions>
        ...
        <extension module="Amazon Books"/>
    </extensions>

    <profile>
        ...
        <subsystem xmlns="urn:mycompany:mysubsystem:1.0">
        </subsystem>
		
    </profile>

Step 2:
After having built this project with a call to "mvn install", the directory "target/module" will contain a subdirectory structure
corresponding to the module name "Amazon Books" (each "." is replaced with a path separator).
This subdirectory contains two files "Thriller.jar" and "module.xml".
Copy the subdirectory of "target/module" to "%WILDFLY_HOME%/modules/system/layers/base/".


Now start the WildFly server.