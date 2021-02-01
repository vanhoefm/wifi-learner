# WiFi-Learner

Go to https://chrismcmstone.github.io/wifi-learner/ for more details.

Note, this is the interface element for learning WiFi state machines. The backend tool (which WiFi-Learner communicates with) can be found here: https://github.com/ChrisMcMStone/statelearner.


# Basic Instructions

First initialize a virtual python environment. This only has to be done once:

	./pysetup.sh

To run the script you first have to disable Wi-Fi in your network manager. Otherwise it will interfere with the script. Then execute:

	rfkill unblock wifi
	ifconfig wlan1 down
	iw wlan1 set type monitor
	ifconfig wlan1 up

When opening a new terminal to execute the script, you first have to become root and load the python environment:

	sudo su
	source venv/bin/activate

You can now execute the script as follows:

	cd src
	python Launcher.py -i wlan1 -t wlan1 -s backupnetwork2 -p Happy2020 -m happy

Here `wlan1` is the wireless network card that will be used, `testnetwork` the network we are connecting to, and `password` the password of the WPA2 network. The file `happy` describes the messages that the tool will sent: in this basic example the file will execute a 4-way handshake that assumes the network is using WPA2 with CCMP as both the unicast and group encryption cipher.

Example output is as follows:

	(venv) [root@mathy-work src]# python Launcher.py -i wlan1 -t wlan1 -s testnetwork -p password -m happy 
	kernel reports: Channel is disabled
	command failed: Invalid argument (-22)
	Detected beacon from testnetwork on channel 11...
	Sniffer MAC address: 00:11:22:33:44:55
	Injector address: 00:11:22:33:44:55
	QUERY: RESET
	RESPONSE: DONE
	QUERY: AUTH
	$ Attempting to authenticate with AP.
	$ Authenticated.
	RESPONSE: AUTH_ACCEPT,0.0
	QUERY: ASSOC(RSNE=cc)
	$ Associated.
	<Dot11  subtype=0 type=Data proto=0 FCfield=from-DS ID=51712 addr1=00:11:22:33:44:55 addr2=99:99:99:99:99:99 addr3=99:99:99:99:99:99 SC=16 |<LLC  dsap=0xaa ssap=0xaa ctrl=3 |<SNAP  OUI=0x0 code=0x888e |<EAPOL  version=802.1X-2001 type=EAPOL-Key len=95 |<EAPOL_Key  DescType=RSN Key |<EAPOL_RSNKey  KeyInfo=HMAC_SHA1_AES+pairwise+ack KeyLength=16 ReplayCounter=2 Nonce=2511baec1b6e47e303f9be5d6e1f96bea9dc850a6c8a4f8a4275469959dc9425 KeyIV=00000000000000000000000000000000 WPAKeyRSC=0000000000000000 WPAKeyID=0000000000000000 WPAKeyMIC=00000000000000000000000000000000 WPAKeyLength=0 |<Padding  load='\xa7d\xc5u' |>>>>>>>
	RESPONSE: E1(KD=WPA2|CS=SHA1),0.0
	QUERY: E2(|KD=WPA2|RSNE=cc|CS=SHA1|)
	<Dot11  subtype=0 type=Data proto=0 FCfield=from-DS ID=51712 addr1=00:11:22:33:44:55 addr2=99:99:99:99:99:99 addr3=99:99:99:99:99:99 SC=32 |<LLC  dsap=0xaa ssap=0xaa ctrl=3 |<SNAP  OUI=0x0 code=0x888e |<EAPOL  version=802.1X-2001 type=EAPOL-Key len=151 |<EAPOL_Key  DescType=RSN Key |<EAPOL_RSNKey  KeyInfo=HMAC_SHA1_AES+pairwise+install+ack+mic+secure+encrypted KeyLength=16 ReplayCounter=3 Nonce=2511baec1b6e47e303f9be5d6e1f96bea9dc850a6c8a4f8a4275469959dc9425 KeyIV=00000000000000000000000000000000 WPAKeyRSC=3f04000000000000 WPAKeyID=0000000000000000 WPAKeyMIC=16da16c8d4c19378324948eb9d59f44b WPAKeyLength=56 WPAKey=b52812ee3e70846746ef972e13b669815a89b82889fe7b95306b97a675721437d1cc51f27546783999a55692113fb37ad2c0284cce9ea59d |<Padding  load='^\xd4\x94k' |>>>>>>>
	RESPONSE: E3(KD=WPA2|CS=SHA1),0.0
	QUERY: E4(|KD=WPA2|CS=SHA1|)
	RESPONSE: TIMEOUT,2.0
	Killed

