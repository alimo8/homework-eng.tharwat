// Top-level build file where you can add configuration options common to all sub-projects/modules.

buildscript {
    dependencies {
        // Plugin الخاص بـ Firebase
        classpath("com.google.gms:google-services:4.3.15")
    }
}

plugins {
    id("com.android.application") version "8.7.0" apply false
    //id("com.android.library") version "8.7.0" apply false
    id("org.jetbrains.kotlin.android") version "1.9.10" apply false
}


allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
