plugins {
    //trick: for the same plugin versions in all sub-modules
    id("com.android.application").version("7.4.1").apply(false)
    id("org.jetbrains.compose").version("1.4.0-rc01").apply(false)

    id("com.android.library").version("7.4.1").apply(false)
    kotlin("multiplatform").version("1.8.10").apply(false)
    kotlin("android").version("1.8.0").apply(false)

    id("dev.icerock.mobile.multiplatform-resources").version("0.21.1").apply(false)

}

buildscript {
    repositories {
        mavenCentral()
    }

    dependencies {
        classpath("org.jetbrains.kotlinx:atomicfu-gradle-plugin:0.20.0")
    }
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}
