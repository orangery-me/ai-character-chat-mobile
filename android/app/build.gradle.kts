plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.aicharacterchat.mobile"
    compileSdk = 36
    ndkVersion = "27.0.12077973"

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.aicharacterchat.mobile"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flavorDimensions += "environment"

    productFlavors {
        create("dev") {
            dimension = "environment"
            applicationId = "com.aicharacterchat.mobile.dev"
            versionNameSuffix = "-dev"
            manifestPlaceholders["appLabel"] = "AI Character Chat DEV"
            manifestPlaceholders["target"] = "lib/main_dev.dart"
        }
        create("staging") {
            dimension = "environment"
            applicationId = "com.aicharacterchat.mobile.staging"
            versionNameSuffix = "-staging"
            manifestPlaceholders["appLabel"] = "AI Character Chat Staging"
            manifestPlaceholders["target"] = "lib/main_staging.dart"
        }
        create("prod") {
            dimension = "environment"
            applicationId = "com.aicharacterchat.mobile"
            manifestPlaceholders["appLabel"] = "AI Character Chat"
            manifestPlaceholders["target"] = "lib/main_prod.dart"
        }
    }

    dependencies {
        implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
        coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")
    }
}

flutter {
    source = "../.."
}
