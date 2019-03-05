from shutil import copyfile

Import('env')

# Python callback
def on_upload(source, target, env):
    bin_folder = env["PROJECTBUILD_DIR"] + "/" + env["PIOENV"] + "/"
    bin_name = env["PROGNAME"] + ".bin"
    copyfile(bin_folder + bin_name, env['PROJECT_DIR'] + "/" + bin_name)

env.Replace(UPLOADCMD=on_upload)
