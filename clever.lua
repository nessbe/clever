-- File:       clever.lua
-- Project:    clever
-- Repository: https://github.com/nessbe/clever
--
-- Copyright (c) 2025 nessbe
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at:
--
--     https://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
-- For more details, see the LICENSE file at the root of the project.

project "clever"
	kind "StaticLib"

	language "C++"
	cppdialect "C++20"

	targetdir("build/bin/%{cfg.system}/%{cfg.architecture}/%{cfg.buildcfg}/%{prj.name}")
	objdir("build/obj/%{cfg.system}/%{cfg.architecture}/%{cfg.buildcfg}/%{prj.name}")

	files {
		"include/**.hpp",
		"include/**.inl",
		"source/**.cpp"
	}

	includedirs {
		"include"
	}

	filter "configurations:debug"
		defines "CLEVER_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:release"
		defines "CLEVER_RELEASE"
		runtime "Release"
		optimize "On"
