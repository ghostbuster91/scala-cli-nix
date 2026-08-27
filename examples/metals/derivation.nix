{ scala-cli-nix }:

scala-cli-nix.buildCoursierApp {
  pname = "metals";
  version = "1.6.8";
  lockFile = ./scala.lock.json;
  # Metals' Java presentation compiler reaches into the internal
  # com.sun.tools.javac.* packages, which the module system closes off on
  # modern JDKs. Open them up so the launcher's `java` can load them.
  javaOptions = [
    "--add-exports=jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED"
    "--add-exports=jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED"
    "--add-exports=jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED"
    "--add-exports=jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED"
    "--add-exports=jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED"
  ];
}
