#!/bin/bash
# Function to to set your location
set_ds_location() {
   echo -e "Where is your Dev Shell installed? e.g. /c/USERS/YOURSID or /c/JPMC/DEV/TMP. You can find this when you open your shell"
   read ds_location
}
#Function to install python and stuff
install_python() {
   echo -e "Installing Python using ds tool..."
   cd $ds_location/ds/tools/dev-shell-cli/latest/bin
   ls
   ds.bat tool install python3.9
   ds.bat tool install awm-python-training
   python.exe -m pip install --upgrade pip
}
# Function to install Python packages using ds tool
install_python_packages_with_ds() {
   echo "Installing Python packages using pip..."
   packages=(
           "requests-kerberos"
           "awmpythoninnovation-awmpy"
           "pandas"
   )
   for pkg in "${packages[@]}"; do
       pip install "$pkg"
   done
}
# Main script execution
main() {
   echo -e "I.D.E.A. \e[1mP\e[0mython \033[1mR\033[0mequirements \033[1mE\033[0mxtraction \033[1mP\033[0mrogram is starting"
   set_ds_location
   install_python
   install_python_packages_with_ds
   echo "Setup complete. Have an I.D.E.A? Leave feedback or request @ http://go/ideahub"
   echo "A Missy Elliot exclusive"
}
# Execute main function
main
