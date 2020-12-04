# An environment that includes Java, Scala, SBT and IntelliJ
# This can be activated in its own using nix-shell, or it can be used as a template
# for a different environment.
# 
# All the property sets can be replaced, including the global nixpkgs one.
# for example, if you would like to use a different jdk version, you can use this function
# as follows:
# 
# ```
# let mkEnv = import /path/to/scala-env.nix ;
# in mkEnv { jdk = pkgs.jdk14 }
# ```
#
# The environment also supports adding additional packages to the buildInputs
# this can be done through the additionalInputs property.
#
# Example:
# ```
# let mkEnv = import /path/to/scala-env.nix ;
# in mkEnv { additionalInputs = [ z3 ] }
# ```
# 
# The list of additionalInputs will be appended to the buildInputs

{ pkgs ? import <nixpkgs> {}, 
  idea-iu ? import ../editors/intellij/idea-iu.nix {},
  scala ? pkgs.scala, 
  sbt ? pkgs.sbt,
  jdk ? pkgs.jdk11,
  additionalInputs ? [] }:

pkgs.mkShell {
  buildInputs = [
    idea-iu
    # Although a JDK is already included in idea-iu the $JAVA_HOME variable is not set 
    # automatically, by adding the dependencies here, the $JAVA_HOME directory will
    # be set correctly
    jdk
    scala 
    sbt
    ./setup.sh
  ] ++ additionalInputs;
}
