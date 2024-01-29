workspace "C++ DLL Template"
    architecture "x64"
    configurations { "Debug", "Release" }

 -- Example project using DLL project
 project "ExampleProject"
    location "ExampleProject"
    kind "ConsoleApp"
    language "C++"
    dependson "DLL-Template"
    targetdir "bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    files { 
        "./ExampleProject/**.h",
        "./ExampleProject/**.hpp",
        "./ExampleProject/**.c",
        "./ExampleProject/**.cpp"
    }

    -- Include the DLL header (header can be placed anywhere)
    includedirs { "./DLL-Template/" }

    -- Add the library directory based on build config
    filter "configurations:Debug"
        defines "DEBUG"
        symbols "On"
        libdirs {
            "./lib/%{cfg.buildcfg}-%{cfg.system}/"
        }


    filter "configurations:Release"
        defines "NDEBUG"    
        optimize "On"
        libdirs {
            "./lib/%{cfg.buildcfg}-%{cfg.system}/"
        }

    -- Link the associated LIB of the DLL/SO.
    filter "system:windows"
        links { "DLL-Template.lib" }
    filter "not system:windows"
        links { "DLL-Template" }

--------------------------------------------------------------------------
 -- DLL Project
 project "DLL-Template"
    location "DLL-Template"
    kind "SharedLib" -- <= Creates a DLL
    language "C++"
    
    -- Build it in separate folders inside of "lib"
    targetdir "./lib/%{cfg.buildcfg}-%{cfg.system}"

    files { 
        "./DLL-Template/**.h",
        "./DLL-Template/**.hpp",
        "./DLL-Template/**.c",
        "./DLL-Template/**.cpp"
    }

    -- Build configs
    filter "configurations:Debug"
        defines "DEBUG"
        symbols "On"


    filter "configurations:Release"
        defines "NDEBUG"    
        optimize "On"