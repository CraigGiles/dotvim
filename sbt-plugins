/**
 * A Scala library to fetch dependencies from Maven / Ivy repositories
 */
addSbtPlugin("io.get-coursier" % "sbt-coursier" % "1.0.0-M14")

/**
 * Display your SBT project's dependency updates.
 */
addSbtPlugin("com.timushev.sbt" % "sbt-updates" % "0.2.0")

/**
 * Visualize your project's dependency graph
 */
addSbtPlugin("net.virtual-void" % "sbt-dependency-graph" % "0.8.2")

/**
 * sbt-revolver is a plugin for SBT enabling a super-fast development
 * turnaround for your Scala applications.
 *
 * It sports the following features:
 *
 * Starting and stopping your application in the background of your
 * interactive SBT shell (in a forked JVM) Triggered restart: automatically
 * restart your application as soon as some of its sources have been
 * changed Even though sbt-revolver works great with spray on spray-can
 * there is nothing spray-specific to it. It can b  used with any Scala
 * application as long as there is some object wit  a main method.
*/
addSbtPlugin("io.spray" % "sbt-revolver" % "0.8.0")

/**
 * Did you ever see a Scala compiler error had no idea what to do next?
 * Did you have to provide an implicit instance of a class but the compiler
 * isn't smart enough to tell you? ScalaClippy helps!
 *
 * ScalaClippy is an advice database that provides helpful hints for
 * compiler errors with additional messages to aid in your debugging.
 */
addSbtPlugin("com.softwaremill.clippy" % "plugin-sbt" % "0.3.0")

/**
 * sbt-dirty-money is an sbt plugin for cleaning Ivy2 cache. If you use
 * publish-local to test plugins and libraries, and you find yourself
 * clearing Ivy2 cache often, this is a tool for you.
 *
 * Adds 4 global tasks to sbt prompt: 
 *  cleanCacheFiles
 *  cleanCache
 *  cleanLocalFiles
 *  cleanLocal.
 */
addSbtPlugin("com.eed3si9n" % "sbt-dirty-money" % "0.1.0")

// ENSIME support
/**
 * This sbt plugin generates a .ensime file and provides various
 * convenience commands for interacting with ENSIME.
 *
 * Create the .ensime file by starting sbt and run the ensimeConfig
 * command.
 */
if (sys.props("java.version").startsWith("1.6"))
  addSbtPlugin("org.ensime" % "sbt-ensime" % "1.0.0")
else
  addSbtPlugin("org.ensime" % "sbt-ensime" % "1.9.1")
