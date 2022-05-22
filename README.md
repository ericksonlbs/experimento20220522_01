# Experimento 20220522_01

## Build Docker Images
### Defects4J Environment
Prepare envirioment with git, maven and cpanminius, clone Defects4J for git: https://github.com/rjust/defects4j, install dependencies and init defects4J. It's possible set JAVA_VERSION (default is 8).
Obs.: This should be slow, because defects4J initialize will be download and install dependencies softwares.
```sh
docker build --pull --rm -f "defects4jenv.dockerfile" -t defects4jenv:java8 --build-arg JAVA_VERSION=8 "."
```
### Defects4J Environment with Jaguar
Use image base "Defects4J Environment" previous created, download Jaguar for git: https://github.com/SIN5005-EngSoft2021/jaguar and build application. It's possible set JAVA_VERSION (default is 8).
```sh
docker build --rm -f "defects4jenvExecJaguar.dockerfile" -t defects4jenvexec:java8_jaguar --build-arg JAVA_VERSION=8 "."
```

### Defects4J Environment with GZoltar
Use image base "Defects4J Environment" previous created, download GZoltar for git: https://github.com/GZoltar/gzoltar and build application. It's possible set JAVA_VERSION (default is 8).
```sh
docker build --rm -f "defects4jenvExecGZoltar.dockerfile" -t defects4jenvexec:java8_gzoltar --build-arg JAVA_VERSION=8 "."
```

### Defects4J Environment with Flacoco
Use image base "Defects4J Environment" previous created, download Flacoco for git: https://github.com/SpoonLabs/flacoco and build application. It's possible set JAVA_VERSION (default is 8).
```sh
docker build --rm -f "defects4jenvExecFlacoco.dockerfile" -t defects4jenvexec:java8_flacoco --build-arg JAVA_VERSION=8 "."
```

### Defects4J Environment for execute Fault Localization
Use image base "Defects4J Environment" previous created, download Flacoco for git: https://github.com/SpoonLabs/flacoco and build application. It's possible set JAVA_VERSION (Default is 8), PROJECT (Projects from Defects4j, for exemple Lang, Math, Time. Default is Lang), BUG (Buggy version from Defects4J. Default is 1), EXEC (options: Flacoco, GZoltar, Jaguar. Default is Jaguar), POM (Force the use of an alternate POM file or directory with pom.xml. Default is pom.xml).

Sample 1: Test buggy 1 from project Lang, using Jaguar with Java 8.

```sh
docker build --rm -f "defects4jenvExecDefect.dockerfile" -t defects4jenvexec:java8_jaguar_lang_51 --build-arg JAVA_VERSION=8 --build-arg PROJECT=Lang --build-arg BUG=51 --build-arg EXEC=jaguar "."
```

Sample 2: Test buggy 1 from project Lang, using Flacoco with Java 8.

```sh
docker build --rm -f "defects4jenvExecDefect.dockerfile" -t defects4jenvexec:java8_flacoco_lang_51 --build-arg JAVA_VERSION=8 --build-arg PROJECT=Lang --build-arg BUG=51 --build-arg EXEC=flacoco "."
```

Sample 4: Test buggy 1 from project Lang, using GZoltar with Java 8.

```sh
docker build --rm -f "defects4jenvExecDefect.dockerfile" -t defects4jenvexec:java8_gzoltar_lang_51 --build-arg JAVA_VERSION=8 --build-arg PROJECT=Lang --build-arg BUG=51 --build-arg EXEC=gzoltar "."
```

### Run container

Sample 1: Running buggy 51 from project Lang, using Jaguar with java 8

```sh
docker run --rm defects4jenvexec:java8_jaguar_lang_51
```

Sample 2: Running buggy 51 from project Lang, using Flacoco with java 8
```sh
docker run --rm defects4jenvexec:java8_flacoco_lang_51
```

Sample 3: Running buggy 51 from project Lang, using GZoltar with java 8
```sh
docker run --rm defects4jenvexec:java8_gzoltar_lang_51
```