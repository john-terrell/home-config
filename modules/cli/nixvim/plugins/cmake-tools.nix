{pkgs, lib, ...}:
{
    plugins.cmake-tools = {
        enable = true;
        settings = {
            cmake_build_directory.__raw = ''
                function()
                    local build_dir_format = os.getenv("LOCAL_BUILD_DIR_FORMAT")
                    if (not build_dir_format) then
                        build_dir_format = "build/%s"
                    end

                    return string.format(build_dir_format, "${variant:buildType}")
                end
            '';
        };
    };
}
