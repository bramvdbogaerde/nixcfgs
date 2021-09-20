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
  scala ? pkgs.scala, 
  sbt ? pkgs.sbt,
  jdk ? pkgs.jdk11,
  additionalInputs ? [],
  ...}@attrs:


let rest = builtins.removeAttrs attrs [
    "pkgs"
    "scala"
    "sbt"
    "jdk"
    "additionalInputs"
]; in 
pkgs.mkShell ({
  buildInputs = [
    jdk
    scala 
    sbt
    ./setup.sh
  ] ++ additionalInputs;
} // rest)
