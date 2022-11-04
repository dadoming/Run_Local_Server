# Run_Local_Server
Bash script to run a HTTP server on a local network.

## Use:
This Bash script was created to access or see personal computer files from another device inside a local network.
It creates a HTTP server using a python3 command.

### Prerequisites:
If not installed:
```
sudo apt-get update && sudo apt install python3
```
It **requires sudo permissions** in order to turn off firewall. After executing it will turn it back on.

### To run:
Just place the executable inside the desired folder and `cd` into that folder, then run in terminal:
```
bash run_local_server.sh
```
If you chose that then just press enter, else type the path to the desired directory.

Then you will be prompted to choose a port, just press enter, else change it to whatever you want.

If everything ran successfully you now have a HTTP server running on local network.
Connect your second device to the same Wi-Fi network as your computer.
Connect to the server by typing the **underlined text** in the search bar in your second device's browser, et voi lá!
(You can also check it out from your personal computer typing the same!) 

To stop server and reactivate firewall press **_Ctrl-C_**.
