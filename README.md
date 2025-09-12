# capire/xflights-java

This is a CAP Java application that manages master data like Airlines, Airports, and Flights.
It provides a reuse package for clients to consume this data. It is used in the [xtravels-java](https://github.com/capire/xtravels-java) application.

## Run

To start the `xflights` application, run the `Application` class in your preferred IDE.
Alternatively, execute `mvn spring-boot:run` on the command line.

## Reuse

You can reuse the client package by adding it to your dependencies in your app's `pom.xml`:

```xml
<dependency>
    <groupId>sap.capire</groupId>
    <artifactId>xflights-data</artifactId>
    <version>1.0.0-SNAPSHOT</version>
</dependency>
```

<details>
<summary>_Using GitHub Packages..._</summary>

  The reuse package is published to the [GitHub Packages](https://docs.github.com/packages) registry,
  which requires you to authenticate to GitHub's Maven repository by adding the following to your `~/.m2/settings.xml`:

  ```xml
  <servers>
    <!-- ... -->
    <server>
      <id>github</id>
      <username>USERNAME</username>
      <password>TOKEN</password>
    </server>
  </servers>
  ```

  As password you're using a Personal Access Token (classic) with `read:packages` scope.
  Read more about it in [Authenticating to GitHub Packages](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-apache-maven-registry).

</details>


## Usage

Then you can import and use the entities in your CDS models like this:

```cds
using { sap.capire.flights.data.Flights } from 'capire/xflights-data';
// mashup with your own entities ...
```
Find examples for that in the [_xtravels-java_ application](https://github.com/capire/xtravels-java/blob/main/db/master-data.cds).


## License

Copyright (c) 2025 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSE) file.
