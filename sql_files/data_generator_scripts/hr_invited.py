import random
import string 
NULL = None

companys = [
    "Sony",
    "Nintendo",
    "Canon",
    "Panasonic",
    "Hitachi",
    "Toshiba",
    "Fujitsu",
    "NEC",
    "Sharp",
    "Renesas",
    "Kyocera",
    "Denso",
    "Nikon",
    "Olympus",
    "Mitsubishi Electric",
    "NTT",
    "NTT Data",
    "NTT Communications",
    "SoftBank",
    "LINE",
    "DeNA",
    "GREE",
    "Rakuten",
    "CyberAgent",
    "mixi",
    "Mercari",
    "Zozo",
    "Cookpad",
    "Money Forward",
    "GMO Internet",
    "DMM.com",
    "Nifty",
    "IIJ",
    "KDDI",
    "Sony Interactive Entertainment",
    "Bandai Namco",
    "Square Enix",
    "Konami",
    "Capcom",
    "Sega",
    "GungHo Online Entertainment",
    "Netmarble Japan",
    "Colopl",
    "GREE VR Capital",
    "WIT",
    "Preferred Networks",
    "Cinnamon",
    "Miroculus",
    "SmartNews",
    "Freee",
    "Soramitsu"
]
status =  ["mailed", "reminder_sent", "no_response", "response_received"] 
admins = [10154, 10161, 10178, 10179, 10194, 10200]
emails = "abcdef" 
num = 345
attr = ["email_id", "hr_status", "company_name", "parent_id"] 
for i in range (500):
    info = []
    for j in attr:
        match j:
            case "email_id":
                mail = "'" + emails + str(num + i).replace("'", "") + "@gmail.com'"  
                info.append(mail)
            case "hr_status":
                n = random.randint(0, 3) 
                info.append("'" + status[n].replace("'", "") + "'") 
            case "company_name":
                n = random.randint(0, len(companys) -1) 
                info.append("'" + companys[n] + "'") 
            case "parent_id":
                n = random.randint(0, len(admins) -1) 
                info.append(admins[n]) 
    tuple_info = tuple(info) 
    with open('hr_in.txt','a') as f:
        f.write("(" + ','.join(str(s) for s in tuple_info) + ')' + ',' + '\n')  
    f.close()


