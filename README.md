#Minimal example to play with Maven and Docker

##3 maven plugins

https://medium.com/containers-101/using-docker-from-maven-and-maven-from-docker-1494238f1cf6

###jib-maven-plugin

###docker-maven-plugin

http://dmp.fabric8.io/docker-maven-plugin.pdf

###dockerfile-maven-plugin

do not use https://github.com/spotify/docker-maven-plugin
but use https://github.com/spotify/dockerfile-maven
usage: https://github.com/spotify/dockerfile-maven/blob/master/docs/usage.md


<!-- https://github.com/spotify/dockerfile-maven/pull/89 -->
					<!-- dockerDirectory>src/main/docker</dockerDirectory -->
					

Adding the configuration to deploy
<configuration>
		<repository>registry.hub.docker.com/flefevre/test</repository>
		<useMavenSettingsForAuth>true</useMavenSettingsForAuth>
		<tag>${project.version}</tag>
		<buildArgs>
			<JAR_FILE>${project.build.finalName}.jar</JAR_FILE>
		</buildArgs>
</configuration>

##Basic commands

- mvn dockerfile:build
- mvn dockerfile:tag
- mvn dockerfile:push

then have a look to https://hub.docker.com/r/flefevre/test/

##Authentification

mvn --encrypt-master-password

vi ~/.m2/settings-security.xml

<settingsSecurity>
	<master>{ENCRYPPASSWORD=}</master>
  </settingsSecurity>

mvn --encrypt-password

vi ~/.m2/settings.xml
<servers>
    <server>
  <id>registry.hub.docker.com</id>
  <username>LOGIN</username>
  <password>{ENCRYPPASSWORD=}</password>
</server>
  </servers>