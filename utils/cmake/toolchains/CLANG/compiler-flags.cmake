set(EXPLICIT_INCLUDES "")
if((CMAKE_VERSION VERSION_GREATER "3.4.0") OR (CMAKE_VERSION VERSION_EQUAL "3.4.0"))
    # from CMake 3.4 <INCLUDES> are separate to <FLAGS> in the
    # CMAKE_<LANG>_COMPILE_OBJECT, CMAKE_<LANG>_CREATE_ASSEMBLY_SOURCE, and
    # CMAKE_<LANG>_CREATE_PREPROCESSED_SOURCE commands
    set(EXPLICIT_INCLUDES "<INCLUDES> ")
endif()

# Override the link rules:
set(CMAKE_C_CREATE_SHARED_LIBRARY "echo 'shared libraries not supported' && 1")
set(CMAKE_C_CREATE_SHARED_MODULE  "echo 'shared modules not supported' && 1")
set(CMAKE_C_CREATE_STATIC_LIBRARY "<CMAKE_AR> -cr <LINK_FLAGS> <TARGET> <OBJECTS>")
set(CMAKE_C_COMPILE_OBJECT        "<CMAKE_C_COMPILER> <DEFINES> ${EXPLICIT_INCLUDES}<FLAGS> -o <OBJECT> -c <SOURCE>")

set(CMAKE_C_LINK_EXECUTABLE       "<CMAKE_C_COMPILER> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> -Wl,-Map,<TARGET>.map -Wl,--start-group <OBJECTS> <LINK_LIBRARIES> -lm -lc -lgcc -lm -lc -lgcc -Wl,--end-group --specs=nano.specs -o <TARGET>")

set(CMAKE_CXX_OUTPUT_EXTENSION ".o")
set(CMAKE_DEPFILE_FLAGS_CXX "-MMD -MT <OBJECT> -MF <DEPFILE>")
set(CMAKE_C_OUTPUT_EXTENSION ".o")
set(CMAKE_DEPFILE_FLAGS_C "-MMD -MT <OBJECT> -MF <DEPFILE>")

set(CMAKE_C_FLAGS_DEBUG_INIT          "-g -gdwarf-3")
set(CMAKE_C_FLAGS_MINSIZEREL_INIT     "-Os -DNDEBUG")
set(CMAKE_C_FLAGS_RELEASE_INIT        "-Os -DNDEBUG")
set(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "-Os -g -gdwarf-3 -DNDEBUG")
set(CMAKE_INCLUDE_SYSTEM_FLAG_C "-isystem ")


set(CMAKE_ASM_FLAGS_DEBUG_INIT          "-g -gdwarf-3")
set(CMAKE_ASM_FLAGS_MINSIZEREL_INIT     "-Os -DNDEBUG")
set(CMAKE_ASM_FLAGS_RELEASE_INIT        "-Os -DNDEBUG")
set(CMAKE_ASM_FLAGS_RELWITHDEBINFO_INIT "-Os -g -gdwarf-3 -DNDEBUG")
set(CMAKE_INCLUDE_SYSTEM_FLAG_ASM  "-isystem ")

set(CMAKE_CXX_CREATE_STATIC_LIBRARY "<CMAKE_AR> -cr <LINK_FLAGS> <TARGET> <OBJECTS>")

set(CMAKE_CXX_LINK_EXECUTABLE       "ld.lld -plugin /usr/lib/gcc/arm-none-eabi/10.3.1/liblto_plugin.so -plugin-opt=/usr/lib/gcc/arm-none-eabi/10.3.1/lto-wrapper -plugin-opt=-fresolution=/tmp/ccB9wEjl.res -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lc_nano -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lc_nano -X -o MICROBIT /usr/lib/gcc/arm-none-eabi/10.3.1/thumb/v7e-m+fp/softfp/crti.o /usr/lib/gcc/arm-none-eabi/10.3.1/thumb/v7e-m+fp/softfp/crtbegin.o /usr/lib/gcc/arm-none-eabi/10.3.1/../../../arm-none-eabi/lib/thumb/v7e-m+fp/softfp/crt0.o -L/usr/lib/gcc/arm-none-eabi/10.3.1/thumb/v7e-m+fp/softfp -L/usr/lib/gcc/arm-none-eabi/10.3.1/../../../arm-none-eabi/lib/thumb/v7e-m+fp/softfp -L/usr/lib/gcc/arm-none-eabi/10.3.1 -L/usr/lib/gcc/arm-none-eabi/10.3.1/../../../arm-none-eabi/lib --gc-sections --sort-common --sort-section=alignment --gc-sections --wrap atexit --start-group -lstdc++_nano -lsupc++_nano -lgcc -lnosys --end-group -Map MICROBIT.map --start-group CMakeFiles/MICROBIT.dir/source/main.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/AccelerometerTest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/AudioTest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/BLETest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/BlinkyTest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/ButtonTest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/CapTouchTest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/DeepSleepTest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/DisplayTest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/GPIOTest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/LightLevelTestRaw.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/MicrophoneTest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/NeopixelsTest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/NoiseProfiler.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/OOB.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/PowerManagementTest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/RadioTestRx.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/SerialNumber.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/SerialStreamer.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/SpeakerTest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/TemperatureTest.cpp.obj CMakeFiles/MICROBIT.dir/source/samples/USBFlashTest.cpp.obj libcodal-microbit-v2.a libcodal-core.a libcodal-nrf52.a libcodal-microbit-nrf5sdk.a libcodal-nrf52.a libcodal-core.a ../libraries/codal-microbit-v2/lib/bootloader.o ../libraries/codal-microbit-v2/lib/mbr.o ../libraries/codal-microbit-v2/lib/settings.o ../libraries/codal-microbit-v2/lib/softdevice.o ../libraries/codal-microbit-v2/lib/uicr.o -lnosys -lstdc++_nano -lsupc++_nano -lm -lc_nano -lgcc -lstdc++_nano -lsupc++_nano -lm -lc_nano -lgcc --end-group -lstdc++_nano -lm -lc_nano --start-group -lgcc -lc_nano --end-group --start-group -lgcc -lc_nano --end-group /usr/lib/gcc/arm-none-eabi/10.3.1/thumb/v7e-m+fp/softfp/crtend.o /usr/lib/gcc/arm-none-eabi/10.3.1/thumb/v7e-m+fp/softfp/crtn.o -T ../libraries/codal-microbit-v2/ld/nrf52833-softdevice.ld")

set(CMAKE_CXX_FLAGS_DEBUG_INIT          "-g -gdwarf-3")
set(CMAKE_CXX_FLAGS_MINSIZEREL_INIT     "-Os -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELEASE_INIT        "-Os -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "-Os -g -gdwarf-3 -DNDEBUG")
set(CMAKE_INCLUDE_SYSTEM_FLAG_CXX "-isystem ")

if (CMAKE_C_COMPILER_VERSION VERSION_GREATER "7.1.0" OR CMAKE_C_COMPILER_VERSION VERSION_EQUAL "7.1.0")
    message("${BoldRed}Supressing -Wexpansion-to-defined.${ColourReset}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-expansion-to-defined")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-expansion-to-defined")
endif ()