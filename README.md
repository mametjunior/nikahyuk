# nikahyuk

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```
nikahyuk
├─ .gitignore
├─ .idea
│  ├─ libraries
│  │  ├─ Dart_SDK.xml
│  │  ├─ Flutter_for_Android.xml
│  │  └─ KotlinJavaRuntime.xml
│  ├─ modules.xml
│  ├─ runConfigurations
│  │  └─ main_dart.xml
│  └─ workspace.xml
├─ .metadata
├─ .packages
├─ .vscode
│  ├─ launch.json
│  └─ settings.json
├─ android
│  ├─ .gradle
│  │  ├─ 4.10.2
│  │  │  ├─ fileChanges
│  │  │  │  └─ last-build.bin
│  │  │  ├─ fileContent
│  │  │  │  └─ fileContent.lock
│  │  │  ├─ fileHashes
│  │  │  │  ├─ fileHashes.bin
│  │  │  │  ├─ fileHashes.lock
│  │  │  │  └─ resourceHashesCache.bin
│  │  │  ├─ gc.properties
│  │  │  ├─ javaCompile
│  │  │  │  ├─ classAnalysis.bin
│  │  │  │  ├─ jarAnalysis.bin
│  │  │  │  ├─ javaCompile.lock
│  │  │  │  └─ taskHistory.bin
│  │  │  ├─ taskHistory
│  │  │  │  ├─ taskHistory.bin
│  │  │  │  └─ taskHistory.lock
│  │  │  └─ vcsMetadata-1
│  │  ├─ buildOutputCleanup
│  │  │  ├─ buildOutputCleanup.lock
│  │  │  ├─ cache.properties
│  │  │  └─ outputFiles.bin
│  │  └─ vcs-1
│  │     └─ gc.properties
│  ├─ app
│  │  ├─ build.gradle
│  │  └─ src
│  │     ├─ debug
│  │     │  └─ AndroidManifest.xml
│  │     ├─ main
│  │     │  ├─ AndroidManifest.xml
│  │     │  ├─ java
│  │     │  │  └─ io
│  │     │  │     └─ flutter
│  │     │  │        └─ plugins
│  │     │  │           └─ GeneratedPluginRegistrant.java
│  │     │  ├─ kotlin
│  │     │  │  └─ com
│  │     │  │     └─ example
│  │     │  │        └─ nikahyuk
│  │     │  │           └─ MainActivity.kt
│  │     │  └─ res
│  │     │     ├─ drawable
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ mipmap-hdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-mdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     └─ values
│  │     │        └─ styles.xml
│  │     └─ profile
│  │        └─ AndroidManifest.xml
│  ├─ build.gradle
│  ├─ gradle
│  │  └─ wrapper
│  │     ├─ gradle-wrapper.jar
│  │     └─ gradle-wrapper.properties
│  ├─ gradle.properties
│  ├─ gradlew
│  ├─ gradlew.bat
│  ├─ local.properties
│  ├─ nikahyuk_android.iml
│  └─ settings.gradle
├─ build
│  ├─ app
│  │  ├─ generated
│  │  │  ├─ not_namespaced_r_class_sources
│  │  │  │  └─ debug
│  │  │  │     └─ processDebugResources
│  │  │  │        └─ r
│  │  │  │           └─ com
│  │  │  │              └─ example
│  │  │  │                 └─ nikahyuk
│  │  │  │                    └─ R.java
│  │  │  ├─ res
│  │  │  │  ├─ pngs
│  │  │  │  │  └─ debug
│  │  │  │  ├─ resValues
│  │  │  │  │  └─ debug
│  │  │  │  └─ rs
│  │  │  │     └─ debug
│  │  │  └─ source
│  │  │     ├─ apt
│  │  │     │  └─ debug
│  │  │     ├─ buildConfig
│  │  │     │  └─ debug
│  │  │     │     └─ com
│  │  │     │        └─ example
│  │  │     │           └─ nikahyuk
│  │  │     │              └─ BuildConfig.java
│  │  │     └─ rs
│  │  │        └─ debug
│  │  ├─ intermediates
│  │  │  ├─ annotation_processor_list
│  │  │  │  └─ debug
│  │  │  │     └─ javaPreCompileDebug
│  │  │  │        └─ annotationProcessors.json
│  │  │  ├─ apk_list
│  │  │  │  └─ debug
│  │  │  │     └─ mainApkListPersistenceDebug
│  │  │  │        └─ apk-list.gson
│  │  │  ├─ blame
│  │  │  │  └─ res
│  │  │  │     └─ debug
│  │  │  │        ├─ multi-v2
│  │  │  │        │  ├─ debug.json
│  │  │  │        │  └─ values.json
│  │  │  │        └─ single
│  │  │  │           └─ debug.json
│  │  │  ├─ check-libraries
│  │  │  │  └─ debug
│  │  │  ├─ check-manifest
│  │  │  │  └─ debug
│  │  │  ├─ checkDebugClasspath
│  │  │  │  └─ debug
│  │  │  ├─ compatible_screen_manifest
│  │  │  │  └─ debug
│  │  │  │     └─ createDebugCompatibleScreenManifests
│  │  │  │        └─ out
│  │  │  │           └─ output.json
│  │  │  ├─ flutter
│  │  │  │  └─ debug
│  │  │  │     ├─ android-x86
│  │  │  │     │  ├─ flutter_assets
│  │  │  │     │  │  ├─ AssetManifest.json
│  │  │  │     │  │  ├─ FontManifest.json
│  │  │  │     │  │  ├─ fonts
│  │  │  │     │  │  │  └─ MaterialIcons-Regular.ttf
│  │  │  │     │  │  ├─ icon_flare
│  │  │  │     │  │  │  ├─ gift.flr
│  │  │  │     │  │  │  ├─ gift2.flr
│  │  │  │     │  │  │  ├─ Home.flr
│  │  │  │     │  │  │  ├─ Home2.flr
│  │  │  │     │  │  │  ├─ Shop.flr
│  │  │  │     │  │  │  ├─ Shop2.flr
│  │  │  │     │  │  │  ├─ Souvenir.flr
│  │  │  │     │  │  │  ├─ Souvenir2.flr
│  │  │  │     │  │  │  ├─ User.flr
│  │  │  │     │  │  │  └─ User2.flr
│  │  │  │     │  │  ├─ isolate_snapshot_data
│  │  │  │     │  │  ├─ kernel_blob.bin
│  │  │  │     │  │  ├─ lib
│  │  │  │     │  │  │  └─ UI
│  │  │  │     │  │  │     └─ kinarian-icon
│  │  │  │     │  │  │        └─ fonts
│  │  │  │     │  │  │           └─ Kinarian.ttf
│  │  │  │     │  │  ├─ LICENSE
│  │  │  │     │  │  ├─ packages
│  │  │  │     │  │  │  └─ cupertino_icons
│  │  │  │     │  │  │     └─ assets
│  │  │  │     │  │  │        └─ CupertinoIcons.ttf
│  │  │  │     │  │  └─ vm_snapshot_data
│  │  │  │     │  └─ snapshot_blob.bin.d
│  │  │  │     └─ libs.jar
│  │  │  ├─ incremental
│  │  │  │  ├─ debug-mergeJavaRes
│  │  │  │  │  ├─ merge-state
│  │  │  │  │  └─ zip-cache
│  │  │  │  │     ├─ 5yQgSiSi6hRQf00wUimQL8vqlUI=
│  │  │  │  │     ├─ k3nUnv_EC1HCGxLpe7fL_fPjDJA=
│  │  │  │  │     ├─ kGr51SoHRJfIeB5zTerGVAJ_n4I=
│  │  │  │  │     ├─ llet4iwA6cVUtpQJvqLw75k+yrs=
│  │  │  │  │     ├─ N2KIebK537xJVrA2KhOy+ZUgCMY=
│  │  │  │  │     └─ QdPXclwKUqZAvAJCI2L9cLEEia4=
│  │  │  │  ├─ debug-mergeJniLibs
│  │  │  │  │  ├─ merge-state
│  │  │  │  │  └─ zip-cache
│  │  │  │  │     ├─ 5yQgSiSi6hRQf00wUimQL8vqlUI=
│  │  │  │  │     ├─ k3nUnv_EC1HCGxLpe7fL_fPjDJA=
│  │  │  │  │     ├─ kGr51SoHRJfIeB5zTerGVAJ_n4I=
│  │  │  │  │     ├─ llet4iwA6cVUtpQJvqLw75k+yrs=
│  │  │  │  │     ├─ N2KIebK537xJVrA2KhOy+ZUgCMY=
│  │  │  │  │     └─ QdPXclwKUqZAvAJCI2L9cLEEia4=
│  │  │  │  ├─ mergeDebugAssets
│  │  │  │  │  └─ merger.xml
│  │  │  │  ├─ mergeDebugJniLibFolders
│  │  │  │  │  └─ merger.xml
│  │  │  │  ├─ mergeDebugResources
│  │  │  │  │  ├─ compile-file-map.properties
│  │  │  │  │  ├─ merged.dir
│  │  │  │  │  │  └─ values
│  │  │  │  │  │     └─ values.xml
│  │  │  │  │  ├─ merger.xml
│  │  │  │  │  └─ stripped.dir
│  │  │  │  ├─ mergeDebugShaders
│  │  │  │  │  └─ merger.xml
│  │  │  │  ├─ packageDebug
│  │  │  │  │  └─ tmp
│  │  │  │  │     └─ debug
│  │  │  │  │        ├─ dex-renamer-state.txt
│  │  │  │  │        ├─ file-input-save-data.txt
│  │  │  │  │        └─ zip-cache
│  │  │  │  │           ├─ lxgI7zoFzZtCsk7GqToFu4LYCJc=
│  │  │  │  │           └─ x_fsOjl6_7gvOxZOv5TZ5bYfpV4=
│  │  │  │  ├─ processDebugResources
│  │  │  │  └─ validateSigningDebug
│  │  │  ├─ instant_run_merged_manifests
│  │  │  │  └─ debug
│  │  │  │     └─ processDebugManifest
│  │  │  │        └─ instant-run
│  │  │  │           └─ output.json
│  │  │  ├─ javac
│  │  │  │  └─ debug
│  │  │  │     └─ compileDebugJavaWithJavac
│  │  │  │        └─ classes
│  │  │  │           ├─ com
│  │  │  │           │  └─ example
│  │  │  │           │     └─ nikahyuk
│  │  │  │           │        ├─ BuildConfig.class
│  │  │  │           │        ├─ R$drawable.class
│  │  │  │           │        ├─ R$mipmap.class
│  │  │  │           │        ├─ R$style.class
│  │  │  │           │        └─ R.class
│  │  │  │           └─ io
│  │  │  │              └─ flutter
│  │  │  │                 └─ plugins
│  │  │  │                    └─ GeneratedPluginRegistrant.class
│  │  │  ├─ jniLibs
│  │  │  │  └─ debug
│  │  │  ├─ lint_jar
│  │  │  │  └─ global
│  │  │  │     └─ prepareLintJar
│  │  │  ├─ merged_assets
│  │  │  │  └─ debug
│  │  │  │     └─ mergeDebugAssets
│  │  │  │        └─ out
│  │  │  │           └─ flutter_assets
│  │  │  │              ├─ AssetManifest.json
│  │  │  │              ├─ FontManifest.json
│  │  │  │              ├─ fonts
│  │  │  │              │  └─ MaterialIcons-Regular.ttf
│  │  │  │              ├─ icon_flare
│  │  │  │              │  ├─ gift.flr
│  │  │  │              │  ├─ gift2.flr
│  │  │  │              │  ├─ Home.flr
│  │  │  │              │  ├─ Home2.flr
│  │  │  │              │  ├─ Shop.flr
│  │  │  │              │  ├─ Shop2.flr
│  │  │  │              │  ├─ Souvenir.flr
│  │  │  │              │  ├─ Souvenir2.flr
│  │  │  │              │  ├─ User.flr
│  │  │  │              │  └─ User2.flr
│  │  │  │              ├─ isolate_snapshot_data
│  │  │  │              ├─ kernel_blob.bin
│  │  │  │              ├─ lib
│  │  │  │              │  └─ UI
│  │  │  │              │     └─ kinarian-icon
│  │  │  │              │        └─ fonts
│  │  │  │              │           └─ Kinarian.ttf
│  │  │  │              ├─ LICENSE
│  │  │  │              ├─ packages
│  │  │  │              │  └─ cupertino_icons
│  │  │  │              │     └─ assets
│  │  │  │              │        └─ CupertinoIcons.ttf
│  │  │  │              └─ vm_snapshot_data
│  │  │  ├─ merged_manifests
│  │  │  │  └─ debug
│  │  │  │     └─ processDebugManifest
│  │  │  │        └─ merged
│  │  │  │           ├─ AndroidManifest.xml
│  │  │  │           └─ output.json
│  │  │  ├─ prebuild
│  │  │  │  └─ debug
│  │  │  ├─ processed_res
│  │  │  │  └─ debug
│  │  │  │     └─ processDebugResources
│  │  │  │        └─ out
│  │  │  │           ├─ output.json
│  │  │  │           └─ resources-debug.ap_
│  │  │  ├─ res
│  │  │  │  ├─ merged
│  │  │  │  │  └─ debug
│  │  │  │  │     ├─ drawable_launch_background.xml.flat
│  │  │  │  │     ├─ mipmap-hdpi_ic_launcher.png.flat
│  │  │  │  │     ├─ mipmap-mdpi_ic_launcher.png.flat
│  │  │  │  │     ├─ mipmap-xhdpi_ic_launcher.png.flat
│  │  │  │  │     ├─ mipmap-xxhdpi_ic_launcher.png.flat
│  │  │  │  │     ├─ mipmap-xxxhdpi_ic_launcher.png.flat
│  │  │  │  │     └─ values_values.arsc.flat
│  │  │  │  └─ symbol-table-with-package
│  │  │  │     └─ debug
│  │  │  ├─ rs
│  │  │  │  └─ debug
│  │  │  │     ├─ lib
│  │  │  │     └─ obj
│  │  │  ├─ shaders
│  │  │  │  └─ debug
│  │  │  ├─ shader_assets
│  │  │  │  └─ debug
│  │  │  │     └─ compileDebugShaders
│  │  │  │        └─ out
│  │  │  ├─ split_list
│  │  │  │  └─ debug
│  │  │  │     └─ splitsDiscoveryTaskDebug
│  │  │  │        └─ split-list.gson
│  │  │  ├─ symbols
│  │  │  │  └─ debug
│  │  │  └─ transforms
│  │  │     ├─ dexBuilder
│  │  │     │  └─ debug
│  │  │     │     ├─ 0.jar
│  │  │     │     ├─ 1.jar
│  │  │     │     ├─ 10.jar
│  │  │     │     ├─ 11.jar
│  │  │     │     ├─ 12
│  │  │     │     │  ├─ com
│  │  │     │     │  │  └─ example
│  │  │     │     │  │     └─ nikahyuk
│  │  │     │     │  │        ├─ BuildConfig.dex
│  │  │     │     │  │        ├─ R$drawable.dex
│  │  │     │     │  │        ├─ R$mipmap.dex
│  │  │     │     │  │        ├─ R$style.dex
│  │  │     │     │  │        └─ R.dex
│  │  │     │     │  └─ io
│  │  │     │     │     └─ flutter
│  │  │     │     │        └─ plugins
│  │  │     │     │           └─ GeneratedPluginRegistrant.dex
│  │  │     │     ├─ 13
│  │  │     │     │  └─ com
│  │  │     │     │     └─ example
│  │  │     │     │        └─ nikahyuk
│  │  │     │     │           └─ MainActivity.dex
│  │  │     │     ├─ 2.jar
│  │  │     │     ├─ 3.jar
│  │  │     │     ├─ 8.jar
│  │  │     │     ├─ 9.jar
│  │  │     │     └─ __content__.json
│  │  │     ├─ dexMerger
│  │  │     │  └─ debug
│  │  │     │     ├─ 0
│  │  │     │     │  └─ classes.dex
│  │  │     │     └─ __content__.json
│  │  │     ├─ externalLibsDexMerger
│  │  │     │  └─ debug
│  │  │     │     ├─ 0
│  │  │     │     │  └─ classes.dex
│  │  │     │     └─ __content__.json
│  │  │     ├─ mergeJavaRes
│  │  │     │  └─ debug
│  │  │     │     ├─ 0.jar
│  │  │     │     └─ __content__.json
│  │  │     └─ mergeJniLibs
│  │  │        └─ debug
│  │  │           ├─ 0
│  │  │           │  └─ lib
│  │  │           │     ├─ armeabi-v7a
│  │  │           │     │  └─ libflutter.so
│  │  │           │     ├─ x86
│  │  │           │     │  └─ libflutter.so
│  │  │           │     └─ x86_64
│  │  │           │        └─ libflutter.so
│  │  │           └─ __content__.json
│  │  ├─ kotlin
│  │  │  └─ compileDebugKotlin
│  │  │     ├─ build-history.bin
│  │  │     ├─ caches-jvm
│  │  │     │  ├─ inputs
│  │  │     │  │  ├─ source-to-output.tab
│  │  │     │  │  ├─ source-to-output.tab.keystream
│  │  │     │  │  ├─ source-to-output.tab.keystream.len
│  │  │     │  │  ├─ source-to-output.tab.len
│  │  │     │  │  ├─ source-to-output.tab.values.at
│  │  │     │  │  ├─ source-to-output.tab_i
│  │  │     │  │  └─ source-to-output.tab_i.len
│  │  │     │  ├─ jvm
│  │  │     │  │  └─ kotlin
│  │  │     │  │     ├─ class-fq-name-to-source.tab
│  │  │     │  │     ├─ class-fq-name-to-source.tab.keystream
│  │  │     │  │     ├─ class-fq-name-to-source.tab.keystream.len
│  │  │     │  │     ├─ class-fq-name-to-source.tab.len
│  │  │     │  │     ├─ class-fq-name-to-source.tab.values.at
│  │  │     │  │     ├─ class-fq-name-to-source.tab_i
│  │  │     │  │     ├─ class-fq-name-to-source.tab_i.len
│  │  │     │  │     ├─ internal-name-to-source.tab
│  │  │     │  │     ├─ internal-name-to-source.tab.keystream
│  │  │     │  │     ├─ internal-name-to-source.tab.keystream.len
│  │  │     │  │     ├─ internal-name-to-source.tab.len
│  │  │     │  │     ├─ internal-name-to-source.tab.values.at
│  │  │     │  │     ├─ internal-name-to-source.tab_i
│  │  │     │  │     ├─ internal-name-to-source.tab_i.len
│  │  │     │  │     ├─ java-sources-proto-map.tab
│  │  │     │  │     ├─ java-sources-proto-map.tab.keystream
│  │  │     │  │     ├─ java-sources-proto-map.tab.keystream.len
│  │  │     │  │     ├─ java-sources-proto-map.tab.len
│  │  │     │  │     ├─ java-sources-proto-map.tab.values.at
│  │  │     │  │     ├─ java-sources-proto-map.tab_i
│  │  │     │  │     ├─ java-sources-proto-map.tab_i.len
│  │  │     │  │     ├─ proto.tab
│  │  │     │  │     ├─ proto.tab.keystream
│  │  │     │  │     ├─ proto.tab.keystream.len
│  │  │     │  │     ├─ proto.tab.len
│  │  │     │  │     ├─ proto.tab.values.at
│  │  │     │  │     ├─ proto.tab_i
│  │  │     │  │     ├─ proto.tab_i.len
│  │  │     │  │     ├─ source-to-classes.tab
│  │  │     │  │     ├─ source-to-classes.tab.keystream
│  │  │     │  │     ├─ source-to-classes.tab.keystream.len
│  │  │     │  │     ├─ source-to-classes.tab.len
│  │  │     │  │     ├─ source-to-classes.tab.values.at
│  │  │     │  │     ├─ source-to-classes.tab_i
│  │  │     │  │     ├─ source-to-classes.tab_i.len
│  │  │     │  │     ├─ subtypes.tab
│  │  │     │  │     ├─ subtypes.tab.keystream
│  │  │     │  │     ├─ subtypes.tab.keystream.len
│  │  │     │  │     ├─ subtypes.tab.len
│  │  │     │  │     ├─ subtypes.tab.values.at
│  │  │     │  │     ├─ subtypes.tab_i
│  │  │     │  │     ├─ subtypes.tab_i.len
│  │  │     │  │     ├─ supertypes.tab
│  │  │     │  │     ├─ supertypes.tab.keystream
│  │  │     │  │     ├─ supertypes.tab.keystream.len
│  │  │     │  │     ├─ supertypes.tab.len
│  │  │     │  │     ├─ supertypes.tab.values.at
│  │  │     │  │     ├─ supertypes.tab_i
│  │  │     │  │     └─ supertypes.tab_i.len
│  │  │     │  └─ lookups
│  │  │     │     ├─ counters.tab
│  │  │     │     ├─ file-to-id.tab
│  │  │     │     ├─ file-to-id.tab.keystream
│  │  │     │     ├─ file-to-id.tab.keystream.len
│  │  │     │     ├─ file-to-id.tab.len
│  │  │     │     ├─ file-to-id.tab.values.at
│  │  │     │     ├─ file-to-id.tab_i
│  │  │     │     ├─ file-to-id.tab_i.len
│  │  │     │     ├─ id-to-file.tab
│  │  │     │     ├─ id-to-file.tab.keystream
│  │  │     │     ├─ id-to-file.tab.keystream.len
│  │  │     │     ├─ id-to-file.tab.len
│  │  │     │     ├─ id-to-file.tab.values.at
│  │  │     │     ├─ lookups.tab
│  │  │     │     ├─ lookups.tab.keystream
│  │  │     │     ├─ lookups.tab.keystream.len
│  │  │     │     ├─ lookups.tab.len
│  │  │     │     ├─ lookups.tab.values.at
│  │  │     │     ├─ lookups.tab_i
│  │  │     │     └─ lookups.tab_i.len
│  │  │     ├─ data-container-format-version.txt
│  │  │     ├─ format-version.txt
│  │  │     ├─ gradle-format-version.txt
│  │  │     └─ last-build.bin
│  │  ├─ outputs
│  │  │  ├─ apk
│  │  │  │  ├─ app.apk
│  │  │  │  ├─ app.apk.sha1
│  │  │  │  └─ debug
│  │  │  │     ├─ app-debug.apk
│  │  │  │     └─ output.json
│  │  │  └─ logs
│  │  │     └─ manifest-merger-debug-report.txt
│  │  └─ tmp
│  │     ├─ compileDebugJavaWithJavac
│  │     ├─ kotlin-classes
│  │     │  └─ debug
│  │     │     ├─ com
│  │     │     │  └─ example
│  │     │     │     └─ nikahyuk
│  │     │     │        └─ MainActivity.class
│  │     │     └─ META-INF
│  │     │        └─ app_debug.kotlin_module
│  │     └─ packLibsflutterBuildDebug
│  │        └─ MANIFEST.MF
│  ├─ app.dill
│  ├─ app.dill.track.dill
│  ├─ app.dill.track.dill.incremental.dill
│  ├─ frontend_server.d
│  └─ kotlin
│     └─ sessions
├─ icon_flare
│  ├─ contoh-loading.flr
│  ├─ gift.flr
│  ├─ gift2.flr
│  ├─ Home.flr
│  ├─ Home2.flr
│  ├─ Shop.flr
│  ├─ Shop2.flr
│  ├─ Souvenir.flr
│  ├─ Souvenir2.flr
│  ├─ User.flr
│  └─ User2.flr
├─ icon_launcher
│  └─ me.png
├─ ios
│  ├─ Flutter
│  │  ├─ AppFrameworkInfo.plist
│  │  ├─ Debug.xcconfig
│  │  ├─ flutter_export_environment.sh
│  │  ├─ Generated.xcconfig
│  │  └─ Release.xcconfig
│  ├─ Runner
│  │  ├─ AppDelegate.swift
│  │  ├─ Assets.xcassets
│  │  │  ├─ AppIcon.appiconset
│  │  │  │  ├─ Contents.json
│  │  │  │  ├─ Icon-App-1024x1024@1x.png
│  │  │  │  ├─ Icon-App-20x20@1x.png
│  │  │  │  ├─ Icon-App-20x20@2x.png
│  │  │  │  ├─ Icon-App-20x20@3x.png
│  │  │  │  ├─ Icon-App-29x29@1x.png
│  │  │  │  ├─ Icon-App-29x29@2x.png
│  │  │  │  ├─ Icon-App-29x29@3x.png
│  │  │  │  ├─ Icon-App-40x40@1x.png
│  │  │  │  ├─ Icon-App-40x40@2x.png
│  │  │  │  ├─ Icon-App-40x40@3x.png
│  │  │  │  ├─ Icon-App-60x60@2x.png
│  │  │  │  ├─ Icon-App-60x60@3x.png
│  │  │  │  ├─ Icon-App-76x76@1x.png
│  │  │  │  ├─ Icon-App-76x76@2x.png
│  │  │  │  └─ Icon-App-83.5x83.5@2x.png
│  │  │  └─ LaunchImage.imageset
│  │  │     ├─ Contents.json
│  │  │     ├─ LaunchImage.png
│  │  │     ├─ LaunchImage@2x.png
│  │  │     ├─ LaunchImage@3x.png
│  │  │     └─ README.md
│  │  ├─ Base.lproj
│  │  │  ├─ LaunchScreen.storyboard
│  │  │  └─ Main.storyboard
│  │  ├─ GeneratedPluginRegistrant.h
│  │  ├─ GeneratedPluginRegistrant.m
│  │  ├─ Info.plist
│  │  └─ Runner-Bridging-Header.h
│  ├─ Runner.xcodeproj
│  │  ├─ project.pbxproj
│  │  ├─ project.xcworkspace
│  │  │  └─ contents.xcworkspacedata
│  │  └─ xcshareddata
│  │     └─ xcschemes
│  │        └─ Runner.xcscheme
│  └─ Runner.xcworkspace
│     └─ contents.xcworkspacedata
├─ lib
│  ├─ api
│  │  └─ api.dart
│  ├─ controller
│  ├─ main.dart
│  ├─ model
│  ├─ Pages
│  │  ├─ halamandepan.dart
│  │  └─ searchitem
│  │     └─ list.dart
│  └─ UI
│     ├─ flutter_swiper
│     │  ├─ .gitignore
│     │  ├─ .idea
│     │  │  ├─ codeStyles
│     │  │  │  └─ Project.xml
│     │  │  ├─ libraries
│     │  │  │  ├─ Dart_Packages.xml
│     │  │  │  ├─ Dart_SDK.xml
│     │  │  │  └─ Flutter_Plugins.xml
│     │  │  ├─ misc.xml
│     │  │  ├─ modules.xml
│     │  │  ├─ vcs.xml
│     │  │  └─ workspace.xml
│     │  ├─ .packages
│     │  ├─ .travis.yml
│     │  ├─ banner.jpg
│     │  ├─ CHANGELOG-ZH.md
│     │  ├─ CHANGELOG.md
│     │  ├─ dev
│     │  │  └─ bots
│     │  │     ├─ travis_install.sh
│     │  │     └─ travis_script.sh
│     │  ├─ flutter_swiper.iml
│     │  ├─ lib
│     │  │  ├─ flutter_swiper.dart
│     │  │  └─ src
│     │  │     ├─ custom_layout.dart
│     │  │     ├─ swiper.dart
│     │  │     ├─ swiper_control.dart
│     │  │     ├─ swiper_controller.dart
│     │  │     ├─ swiper_pagination.dart
│     │  │     └─ swiper_plugin.dart
│     │  ├─ LICENSE
│     │  ├─ pubspec.lock
│     │  ├─ pubspec.yaml
│     │  ├─ README-ZH.md
│     │  ├─ README.md
│     │  ├─ ROADMAP.md
│     │  └─ test
│     │     ├─ control_test.dart
│     │     ├─ flutter_swiper_test.dart
│     │     ├─ layout_test.dart
│     │     └─ pagination_test.dart
│     └─ kinarian-icon
│        ├─ config.json
│        ├─ fonts
│        │  └─ Kinarian.ttf
│        └─ kinarian_icons.dart
├─ nikahyuk.iml
├─ pubspec.lock
├─ pubspec.yaml
└─ README.md

```
```
nikahyuk
├─ .gitignore
├─ .idea
│  ├─ libraries
│  │  ├─ Dart_SDK.xml
│  │  ├─ Flutter_for_Android.xml
│  │  └─ KotlinJavaRuntime.xml
│  ├─ modules.xml
│  ├─ runConfigurations
│  │  └─ main_dart.xml
│  └─ workspace.xml
├─ .metadata
├─ .packages
├─ .vscode
│  ├─ launch.json
│  └─ settings.json
├─ android
│  ├─ .gradle
│  │  ├─ 4.10.2
│  │  │  ├─ fileChanges
│  │  │  │  └─ last-build.bin
│  │  │  ├─ fileContent
│  │  │  │  └─ fileContent.lock
│  │  │  ├─ fileHashes
│  │  │  │  ├─ fileHashes.bin
│  │  │  │  ├─ fileHashes.lock
│  │  │  │  └─ resourceHashesCache.bin
│  │  │  ├─ gc.properties
│  │  │  ├─ javaCompile
│  │  │  │  ├─ classAnalysis.bin
│  │  │  │  ├─ jarAnalysis.bin
│  │  │  │  ├─ javaCompile.lock
│  │  │  │  └─ taskHistory.bin
│  │  │  ├─ taskHistory
│  │  │  │  ├─ taskHistory.bin
│  │  │  │  └─ taskHistory.lock
│  │  │  └─ vcsMetadata-1
│  │  ├─ buildOutputCleanup
│  │  │  ├─ buildOutputCleanup.lock
│  │  │  ├─ cache.properties
│  │  │  └─ outputFiles.bin
│  │  └─ vcs-1
│  │     └─ gc.properties
│  ├─ app
│  │  ├─ build.gradle
│  │  └─ src
│  │     ├─ debug
│  │     │  └─ AndroidManifest.xml
│  │     ├─ main
│  │     │  ├─ AndroidManifest.xml
│  │     │  ├─ java
│  │     │  │  └─ io
│  │     │  │     └─ flutter
│  │     │  │        └─ plugins
│  │     │  │           └─ GeneratedPluginRegistrant.java
│  │     │  ├─ kotlin
│  │     │  │  └─ com
│  │     │  │     └─ example
│  │     │  │        └─ nikahyuk
│  │     │  │           └─ MainActivity.kt
│  │     │  └─ res
│  │     │     ├─ drawable
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ mipmap-hdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-mdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     └─ values
│  │     │        └─ styles.xml
│  │     └─ profile
│  │        └─ AndroidManifest.xml
│  ├─ build.gradle
│  ├─ gradle
│  │  └─ wrapper
│  │     ├─ gradle-wrapper.jar
│  │     └─ gradle-wrapper.properties
│  ├─ gradle.properties
│  ├─ gradlew
│  ├─ gradlew.bat
│  ├─ local.properties
│  ├─ nikahyuk_android.iml
│  └─ settings.gradle
├─ build
│  ├─ app
│  │  ├─ generated
│  │  │  ├─ not_namespaced_r_class_sources
│  │  │  │  └─ debug
│  │  │  │     └─ processDebugResources
│  │  │  │        └─ r
│  │  │  │           └─ com
│  │  │  │              └─ example
│  │  │  │                 └─ nikahyuk
│  │  │  │                    └─ R.java
│  │  │  ├─ res
│  │  │  │  ├─ pngs
│  │  │  │  │  └─ debug
│  │  │  │  ├─ resValues
│  │  │  │  │  └─ debug
│  │  │  │  └─ rs
│  │  │  │     └─ debug
│  │  │  └─ source
│  │  │     ├─ apt
│  │  │     │  └─ debug
│  │  │     ├─ buildConfig
│  │  │     │  └─ debug
│  │  │     │     └─ com
│  │  │     │        └─ example
│  │  │     │           └─ nikahyuk
│  │  │     │              └─ BuildConfig.java
│  │  │     └─ rs
│  │  │        └─ debug
│  │  ├─ intermediates
│  │  │  ├─ annotation_processor_list
│  │  │  │  └─ debug
│  │  │  │     └─ javaPreCompileDebug
│  │  │  │        └─ annotationProcessors.json
│  │  │  ├─ apk_list
│  │  │  │  └─ debug
│  │  │  │     └─ mainApkListPersistenceDebug
│  │  │  │        └─ apk-list.gson
│  │  │  ├─ blame
│  │  │  │  └─ res
│  │  │  │     └─ debug
│  │  │  │        ├─ multi-v2
│  │  │  │        │  ├─ debug.json
│  │  │  │        │  └─ values.json
│  │  │  │        └─ single
│  │  │  │           └─ debug.json
│  │  │  ├─ check-libraries
│  │  │  │  └─ debug
│  │  │  ├─ check-manifest
│  │  │  │  └─ debug
│  │  │  ├─ checkDebugClasspath
│  │  │  │  └─ debug
│  │  │  ├─ compatible_screen_manifest
│  │  │  │  └─ debug
│  │  │  │     └─ createDebugCompatibleScreenManifests
│  │  │  │        └─ out
│  │  │  │           └─ output.json
│  │  │  ├─ flutter
│  │  │  │  └─ debug
│  │  │  │     ├─ android-x86
│  │  │  │     │  ├─ flutter_assets
│  │  │  │     │  │  ├─ AssetManifest.json
│  │  │  │     │  │  ├─ FontManifest.json
│  │  │  │     │  │  ├─ fonts
│  │  │  │     │  │  │  └─ MaterialIcons-Regular.ttf
│  │  │  │     │  │  ├─ icon_flare
│  │  │  │     │  │  │  ├─ gift.flr
│  │  │  │     │  │  │  ├─ gift2.flr
│  │  │  │     │  │  │  ├─ Home.flr
│  │  │  │     │  │  │  ├─ Home2.flr
│  │  │  │     │  │  │  ├─ Shop.flr
│  │  │  │     │  │  │  ├─ Shop2.flr
│  │  │  │     │  │  │  ├─ Souvenir.flr
│  │  │  │     │  │  │  ├─ Souvenir2.flr
│  │  │  │     │  │  │  ├─ User.flr
│  │  │  │     │  │  │  └─ User2.flr
│  │  │  │     │  │  ├─ isolate_snapshot_data
│  │  │  │     │  │  ├─ kernel_blob.bin
│  │  │  │     │  │  ├─ lib
│  │  │  │     │  │  │  └─ UI
│  │  │  │     │  │  │     └─ kinarian-icon
│  │  │  │     │  │  │        └─ fonts
│  │  │  │     │  │  │           └─ Kinarian.ttf
│  │  │  │     │  │  ├─ LICENSE
│  │  │  │     │  │  ├─ packages
│  │  │  │     │  │  │  └─ cupertino_icons
│  │  │  │     │  │  │     └─ assets
│  │  │  │     │  │  │        └─ CupertinoIcons.ttf
│  │  │  │     │  │  └─ vm_snapshot_data
│  │  │  │     │  └─ snapshot_blob.bin.d
│  │  │  │     └─ libs.jar
│  │  │  ├─ incremental
│  │  │  │  ├─ debug-mergeJavaRes
│  │  │  │  │  ├─ merge-state
│  │  │  │  │  └─ zip-cache
│  │  │  │  │     ├─ 5yQgSiSi6hRQf00wUimQL8vqlUI=
│  │  │  │  │     ├─ k3nUnv_EC1HCGxLpe7fL_fPjDJA=
│  │  │  │  │     ├─ kGr51SoHRJfIeB5zTerGVAJ_n4I=
│  │  │  │  │     ├─ llet4iwA6cVUtpQJvqLw75k+yrs=
│  │  │  │  │     ├─ N2KIebK537xJVrA2KhOy+ZUgCMY=
│  │  │  │  │     └─ QdPXclwKUqZAvAJCI2L9cLEEia4=
│  │  │  │  ├─ debug-mergeJniLibs
│  │  │  │  │  ├─ merge-state
│  │  │  │  │  └─ zip-cache
│  │  │  │  │     ├─ 5yQgSiSi6hRQf00wUimQL8vqlUI=
│  │  │  │  │     ├─ k3nUnv_EC1HCGxLpe7fL_fPjDJA=
│  │  │  │  │     ├─ kGr51SoHRJfIeB5zTerGVAJ_n4I=
│  │  │  │  │     ├─ llet4iwA6cVUtpQJvqLw75k+yrs=
│  │  │  │  │     ├─ N2KIebK537xJVrA2KhOy+ZUgCMY=
│  │  │  │  │     └─ QdPXclwKUqZAvAJCI2L9cLEEia4=
│  │  │  │  ├─ mergeDebugAssets
│  │  │  │  │  └─ merger.xml
│  │  │  │  ├─ mergeDebugJniLibFolders
│  │  │  │  │  └─ merger.xml
│  │  │  │  ├─ mergeDebugResources
│  │  │  │  │  ├─ compile-file-map.properties
│  │  │  │  │  ├─ merged.dir
│  │  │  │  │  │  └─ values
│  │  │  │  │  │     └─ values.xml
│  │  │  │  │  ├─ merger.xml
│  │  │  │  │  └─ stripped.dir
│  │  │  │  ├─ mergeDebugShaders
│  │  │  │  │  └─ merger.xml
│  │  │  │  ├─ packageDebug
│  │  │  │  │  └─ tmp
│  │  │  │  │     └─ debug
│  │  │  │  │        ├─ dex-renamer-state.txt
│  │  │  │  │        ├─ file-input-save-data.txt
│  │  │  │  │        └─ zip-cache
│  │  │  │  │           ├─ lxgI7zoFzZtCsk7GqToFu4LYCJc=
│  │  │  │  │           └─ x_fsOjl6_7gvOxZOv5TZ5bYfpV4=
│  │  │  │  ├─ processDebugResources
│  │  │  │  └─ validateSigningDebug
│  │  │  ├─ instant_run_merged_manifests
│  │  │  │  └─ debug
│  │  │  │     └─ processDebugManifest
│  │  │  │        └─ instant-run
│  │  │  │           └─ output.json
│  │  │  ├─ javac
│  │  │  │  └─ debug
│  │  │  │     └─ compileDebugJavaWithJavac
│  │  │  │        └─ classes
│  │  │  │           ├─ com
│  │  │  │           │  └─ example
│  │  │  │           │     └─ nikahyuk
│  │  │  │           │        ├─ BuildConfig.class
│  │  │  │           │        ├─ R$drawable.class
│  │  │  │           │        ├─ R$mipmap.class
│  │  │  │           │        ├─ R$style.class
│  │  │  │           │        └─ R.class
│  │  │  │           └─ io
│  │  │  │              └─ flutter
│  │  │  │                 └─ plugins
│  │  │  │                    └─ GeneratedPluginRegistrant.class
│  │  │  ├─ jniLibs
│  │  │  │  └─ debug
│  │  │  ├─ lint_jar
│  │  │  │  └─ global
│  │  │  │     └─ prepareLintJar
│  │  │  ├─ merged_assets
│  │  │  │  └─ debug
│  │  │  │     └─ mergeDebugAssets
│  │  │  │        └─ out
│  │  │  │           └─ flutter_assets
│  │  │  │              ├─ AssetManifest.json
│  │  │  │              ├─ FontManifest.json
│  │  │  │              ├─ fonts
│  │  │  │              │  └─ MaterialIcons-Regular.ttf
│  │  │  │              ├─ icon_flare
│  │  │  │              │  ├─ gift.flr
│  │  │  │              │  ├─ gift2.flr
│  │  │  │              │  ├─ Home.flr
│  │  │  │              │  ├─ Home2.flr
│  │  │  │              │  ├─ Shop.flr
│  │  │  │              │  ├─ Shop2.flr
│  │  │  │              │  ├─ Souvenir.flr
│  │  │  │              │  ├─ Souvenir2.flr
│  │  │  │              │  ├─ User.flr
│  │  │  │              │  └─ User2.flr
│  │  │  │              ├─ isolate_snapshot_data
│  │  │  │              ├─ kernel_blob.bin
│  │  │  │              ├─ lib
│  │  │  │              │  └─ UI
│  │  │  │              │     └─ kinarian-icon
│  │  │  │              │        └─ fonts
│  │  │  │              │           └─ Kinarian.ttf
│  │  │  │              ├─ LICENSE
│  │  │  │              ├─ packages
│  │  │  │              │  └─ cupertino_icons
│  │  │  │              │     └─ assets
│  │  │  │              │        └─ CupertinoIcons.ttf
│  │  │  │              └─ vm_snapshot_data
│  │  │  ├─ merged_manifests
│  │  │  │  └─ debug
│  │  │  │     └─ processDebugManifest
│  │  │  │        └─ merged
│  │  │  │           ├─ AndroidManifest.xml
│  │  │  │           └─ output.json
│  │  │  ├─ prebuild
│  │  │  │  └─ debug
│  │  │  ├─ processed_res
│  │  │  │  └─ debug
│  │  │  │     └─ processDebugResources
│  │  │  │        └─ out
│  │  │  │           ├─ output.json
│  │  │  │           └─ resources-debug.ap_
│  │  │  ├─ res
│  │  │  │  ├─ merged
│  │  │  │  │  └─ debug
│  │  │  │  │     ├─ drawable_launch_background.xml.flat
│  │  │  │  │     ├─ mipmap-hdpi_ic_launcher.png.flat
│  │  │  │  │     ├─ mipmap-mdpi_ic_launcher.png.flat
│  │  │  │  │     ├─ mipmap-xhdpi_ic_launcher.png.flat
│  │  │  │  │     ├─ mipmap-xxhdpi_ic_launcher.png.flat
│  │  │  │  │     ├─ mipmap-xxxhdpi_ic_launcher.png.flat
│  │  │  │  │     └─ values_values.arsc.flat
│  │  │  │  └─ symbol-table-with-package
│  │  │  │     └─ debug
│  │  │  ├─ rs
│  │  │  │  └─ debug
│  │  │  │     ├─ lib
│  │  │  │     └─ obj
│  │  │  ├─ shaders
│  │  │  │  └─ debug
│  │  │  ├─ shader_assets
│  │  │  │  └─ debug
│  │  │  │     └─ compileDebugShaders
│  │  │  │        └─ out
│  │  │  ├─ split_list
│  │  │  │  └─ debug
│  │  │  │     └─ splitsDiscoveryTaskDebug
│  │  │  │        └─ split-list.gson
│  │  │  ├─ symbols
│  │  │  │  └─ debug
│  │  │  └─ transforms
│  │  │     ├─ dexBuilder
│  │  │     │  └─ debug
│  │  │     │     ├─ 0.jar
│  │  │     │     ├─ 1.jar
│  │  │     │     ├─ 10.jar
│  │  │     │     ├─ 11.jar
│  │  │     │     ├─ 12
│  │  │     │     │  ├─ com
│  │  │     │     │  │  └─ example
│  │  │     │     │  │     └─ nikahyuk
│  │  │     │     │  │        ├─ BuildConfig.dex
│  │  │     │     │  │        ├─ R$drawable.dex
│  │  │     │     │  │        ├─ R$mipmap.dex
│  │  │     │     │  │        ├─ R$style.dex
│  │  │     │     │  │        └─ R.dex
│  │  │     │     │  └─ io
│  │  │     │     │     └─ flutter
│  │  │     │     │        └─ plugins
│  │  │     │     │           └─ GeneratedPluginRegistrant.dex
│  │  │     │     ├─ 13
│  │  │     │     │  └─ com
│  │  │     │     │     └─ example
│  │  │     │     │        └─ nikahyuk
│  │  │     │     │           └─ MainActivity.dex
│  │  │     │     ├─ 2.jar
│  │  │     │     ├─ 3.jar
│  │  │     │     ├─ 8.jar
│  │  │     │     ├─ 9.jar
│  │  │     │     └─ __content__.json
│  │  │     ├─ dexMerger
│  │  │     │  └─ debug
│  │  │     │     ├─ 0
│  │  │     │     │  └─ classes.dex
│  │  │     │     └─ __content__.json
│  │  │     ├─ externalLibsDexMerger
│  │  │     │  └─ debug
│  │  │     │     ├─ 0
│  │  │     │     │  └─ classes.dex
│  │  │     │     └─ __content__.json
│  │  │     ├─ mergeJavaRes
│  │  │     │  └─ debug
│  │  │     │     ├─ 0.jar
│  │  │     │     └─ __content__.json
│  │  │     └─ mergeJniLibs
│  │  │        └─ debug
│  │  │           ├─ 0
│  │  │           │  └─ lib
│  │  │           │     ├─ armeabi-v7a
│  │  │           │     │  └─ libflutter.so
│  │  │           │     ├─ x86
│  │  │           │     │  └─ libflutter.so
│  │  │           │     └─ x86_64
│  │  │           │        └─ libflutter.so
│  │  │           └─ __content__.json
│  │  ├─ kotlin
│  │  │  └─ compileDebugKotlin
│  │  │     ├─ build-history.bin
│  │  │     ├─ caches-jvm
│  │  │     │  ├─ inputs
│  │  │     │  │  ├─ source-to-output.tab
│  │  │     │  │  ├─ source-to-output.tab.keystream
│  │  │     │  │  ├─ source-to-output.tab.keystream.len
│  │  │     │  │  ├─ source-to-output.tab.len
│  │  │     │  │  ├─ source-to-output.tab.values.at
│  │  │     │  │  ├─ source-to-output.tab_i
│  │  │     │  │  └─ source-to-output.tab_i.len
│  │  │     │  ├─ jvm
│  │  │     │  │  └─ kotlin
│  │  │     │  │     ├─ class-fq-name-to-source.tab
│  │  │     │  │     ├─ class-fq-name-to-source.tab.keystream
│  │  │     │  │     ├─ class-fq-name-to-source.tab.keystream.len
│  │  │     │  │     ├─ class-fq-name-to-source.tab.len
│  │  │     │  │     ├─ class-fq-name-to-source.tab.values.at
│  │  │     │  │     ├─ class-fq-name-to-source.tab_i
│  │  │     │  │     ├─ class-fq-name-to-source.tab_i.len
│  │  │     │  │     ├─ internal-name-to-source.tab
│  │  │     │  │     ├─ internal-name-to-source.tab.keystream
│  │  │     │  │     ├─ internal-name-to-source.tab.keystream.len
│  │  │     │  │     ├─ internal-name-to-source.tab.len
│  │  │     │  │     ├─ internal-name-to-source.tab.values.at
│  │  │     │  │     ├─ internal-name-to-source.tab_i
│  │  │     │  │     ├─ internal-name-to-source.tab_i.len
│  │  │     │  │     ├─ java-sources-proto-map.tab
│  │  │     │  │     ├─ java-sources-proto-map.tab.keystream
│  │  │     │  │     ├─ java-sources-proto-map.tab.keystream.len
│  │  │     │  │     ├─ java-sources-proto-map.tab.len
│  │  │     │  │     ├─ java-sources-proto-map.tab.values.at
│  │  │     │  │     ├─ java-sources-proto-map.tab_i
│  │  │     │  │     ├─ java-sources-proto-map.tab_i.len
│  │  │     │  │     ├─ proto.tab
│  │  │     │  │     ├─ proto.tab.keystream
│  │  │     │  │     ├─ proto.tab.keystream.len
│  │  │     │  │     ├─ proto.tab.len
│  │  │     │  │     ├─ proto.tab.values.at
│  │  │     │  │     ├─ proto.tab_i
│  │  │     │  │     ├─ proto.tab_i.len
│  │  │     │  │     ├─ source-to-classes.tab
│  │  │     │  │     ├─ source-to-classes.tab.keystream
│  │  │     │  │     ├─ source-to-classes.tab.keystream.len
│  │  │     │  │     ├─ source-to-classes.tab.len
│  │  │     │  │     ├─ source-to-classes.tab.values.at
│  │  │     │  │     ├─ source-to-classes.tab_i
│  │  │     │  │     ├─ source-to-classes.tab_i.len
│  │  │     │  │     ├─ subtypes.tab
│  │  │     │  │     ├─ subtypes.tab.keystream
│  │  │     │  │     ├─ subtypes.tab.keystream.len
│  │  │     │  │     ├─ subtypes.tab.len
│  │  │     │  │     ├─ subtypes.tab.values.at
│  │  │     │  │     ├─ subtypes.tab_i
│  │  │     │  │     ├─ subtypes.tab_i.len
│  │  │     │  │     ├─ supertypes.tab
│  │  │     │  │     ├─ supertypes.tab.keystream
│  │  │     │  │     ├─ supertypes.tab.keystream.len
│  │  │     │  │     ├─ supertypes.tab.len
│  │  │     │  │     ├─ supertypes.tab.values.at
│  │  │     │  │     ├─ supertypes.tab_i
│  │  │     │  │     └─ supertypes.tab_i.len
│  │  │     │  └─ lookups
│  │  │     │     ├─ counters.tab
│  │  │     │     ├─ file-to-id.tab
│  │  │     │     ├─ file-to-id.tab.keystream
│  │  │     │     ├─ file-to-id.tab.keystream.len
│  │  │     │     ├─ file-to-id.tab.len
│  │  │     │     ├─ file-to-id.tab.values.at
│  │  │     │     ├─ file-to-id.tab_i
│  │  │     │     ├─ file-to-id.tab_i.len
│  │  │     │     ├─ id-to-file.tab
│  │  │     │     ├─ id-to-file.tab.keystream
│  │  │     │     ├─ id-to-file.tab.keystream.len
│  │  │     │     ├─ id-to-file.tab.len
│  │  │     │     ├─ id-to-file.tab.values.at
│  │  │     │     ├─ lookups.tab
│  │  │     │     ├─ lookups.tab.keystream
│  │  │     │     ├─ lookups.tab.keystream.len
│  │  │     │     ├─ lookups.tab.len
│  │  │     │     ├─ lookups.tab.values.at
│  │  │     │     ├─ lookups.tab_i
│  │  │     │     └─ lookups.tab_i.len
│  │  │     ├─ data-container-format-version.txt
│  │  │     ├─ format-version.txt
│  │  │     ├─ gradle-format-version.txt
│  │  │     └─ last-build.bin
│  │  ├─ outputs
│  │  │  ├─ apk
│  │  │  │  ├─ app.apk
│  │  │  │  ├─ app.apk.sha1
│  │  │  │  └─ debug
│  │  │  │     ├─ app-debug.apk
│  │  │  │     └─ output.json
│  │  │  └─ logs
│  │  │     └─ manifest-merger-debug-report.txt
│  │  └─ tmp
│  │     ├─ compileDebugJavaWithJavac
│  │     ├─ kotlin-classes
│  │     │  └─ debug
│  │     │     ├─ com
│  │     │     │  └─ example
│  │     │     │     └─ nikahyuk
│  │     │     │        └─ MainActivity.class
│  │     │     └─ META-INF
│  │     │        └─ app_debug.kotlin_module
│  │     └─ packLibsflutterBuildDebug
│  │        └─ MANIFEST.MF
│  ├─ app.dill
│  ├─ app.dill.track.dill
│  ├─ app.dill.track.dill.incremental.dill
│  ├─ frontend_server.d
│  └─ kotlin
│     └─ sessions
├─ icon_flare
│  ├─ contoh-loading.flr
│  ├─ gift.flr
│  ├─ gift2.flr
│  ├─ Home.flr
│  ├─ Home2.flr
│  ├─ Shop.flr
│  ├─ Shop2.flr
│  ├─ Souvenir.flr
│  ├─ Souvenir2.flr
│  ├─ User.flr
│  └─ User2.flr
├─ icon_launcher
│  └─ me.png
├─ ios
│  ├─ Flutter
│  │  ├─ AppFrameworkInfo.plist
│  │  ├─ Debug.xcconfig
│  │  ├─ flutter_export_environment.sh
│  │  ├─ Generated.xcconfig
│  │  └─ Release.xcconfig
│  ├─ Runner
│  │  ├─ AppDelegate.swift
│  │  ├─ Assets.xcassets
│  │  │  ├─ AppIcon.appiconset
│  │  │  │  ├─ Contents.json
│  │  │  │  ├─ Icon-App-1024x1024@1x.png
│  │  │  │  ├─ Icon-App-20x20@1x.png
│  │  │  │  ├─ Icon-App-20x20@2x.png
│  │  │  │  ├─ Icon-App-20x20@3x.png
│  │  │  │  ├─ Icon-App-29x29@1x.png
│  │  │  │  ├─ Icon-App-29x29@2x.png
│  │  │  │  ├─ Icon-App-29x29@3x.png
│  │  │  │  ├─ Icon-App-40x40@1x.png
│  │  │  │  ├─ Icon-App-40x40@2x.png
│  │  │  │  ├─ Icon-App-40x40@3x.png
│  │  │  │  ├─ Icon-App-60x60@2x.png
│  │  │  │  ├─ Icon-App-60x60@3x.png
│  │  │  │  ├─ Icon-App-76x76@1x.png
│  │  │  │  ├─ Icon-App-76x76@2x.png
│  │  │  │  └─ Icon-App-83.5x83.5@2x.png
│  │  │  └─ LaunchImage.imageset
│  │  │     ├─ Contents.json
│  │  │     ├─ LaunchImage.png
│  │  │     ├─ LaunchImage@2x.png
│  │  │     ├─ LaunchImage@3x.png
│  │  │     └─ README.md
│  │  ├─ Base.lproj
│  │  │  ├─ LaunchScreen.storyboard
│  │  │  └─ Main.storyboard
│  │  ├─ GeneratedPluginRegistrant.h
│  │  ├─ GeneratedPluginRegistrant.m
│  │  ├─ Info.plist
│  │  └─ Runner-Bridging-Header.h
│  ├─ Runner.xcodeproj
│  │  ├─ project.pbxproj
│  │  ├─ project.xcworkspace
│  │  │  └─ contents.xcworkspacedata
│  │  └─ xcshareddata
│  │     └─ xcschemes
│  │        └─ Runner.xcscheme
│  └─ Runner.xcworkspace
│     └─ contents.xcworkspacedata
├─ lib
│  ├─ api
│  │  └─ api.dart
│  ├─ controller
│  ├─ main.dart
│  ├─ model
│  ├─ Pages
│  │  ├─ halamandepan.dart
│  │  └─ searchitem
│  │     └─ list.dart
│  └─ UI
│     ├─ flutter_swiper
│     │  ├─ .gitignore
│     │  ├─ .idea
│     │  │  ├─ codeStyles
│     │  │  │  └─ Project.xml
│     │  │  ├─ libraries
│     │  │  │  ├─ Dart_Packages.xml
│     │  │  │  ├─ Dart_SDK.xml
│     │  │  │  └─ Flutter_Plugins.xml
│     │  │  ├─ misc.xml
│     │  │  ├─ modules.xml
│     │  │  ├─ vcs.xml
│     │  │  └─ workspace.xml
│     │  ├─ .packages
│     │  ├─ .travis.yml
│     │  ├─ banner.jpg
│     │  ├─ CHANGELOG-ZH.md
│     │  ├─ CHANGELOG.md
│     │  ├─ dev
│     │  │  └─ bots
│     │  │     ├─ travis_install.sh
│     │  │     └─ travis_script.sh
│     │  ├─ flutter_swiper.iml
│     │  ├─ lib
│     │  │  ├─ flutter_swiper.dart
│     │  │  └─ src
│     │  │     ├─ custom_layout.dart
│     │  │     ├─ swiper.dart
│     │  │     ├─ swiper_control.dart
│     │  │     ├─ swiper_controller.dart
│     │  │     ├─ swiper_pagination.dart
│     │  │     └─ swiper_plugin.dart
│     │  ├─ LICENSE
│     │  ├─ pubspec.lock
│     │  ├─ pubspec.yaml
│     │  ├─ README-ZH.md
│     │  ├─ README.md
│     │  ├─ ROADMAP.md
│     │  └─ test
│     │     ├─ control_test.dart
│     │     ├─ flutter_swiper_test.dart
│     │     ├─ layout_test.dart
│     │     └─ pagination_test.dart
│     └─ kinarian-icon
│        ├─ config.json
│        ├─ fonts
│        │  └─ Kinarian.ttf
│        └─ kinarian_icons.dart
├─ nikahyuk.iml
├─ pubspec.lock
├─ pubspec.yaml
└─ README.md

```