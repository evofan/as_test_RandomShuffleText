onClipEvent (load) {
    myName = "fullthrottles";
    myMax = myName.length;
    tClip = "!#$%&/?abcdefghijklmnopqrstuvwxyz;:";
    setMax = tClip.length;
    interval = 2;
    i = cnt = 0;
    Check = true;
}
onClipEvent (enterFrame) {
    if (i < myMax) {
        if (cnt < interval) {
            txt = myName.substr(0,i);
            for (j = i; j <myMax; j++) {
                Rnd = Math.floor(Math.random()*setMax);
                txt += tClip.charAt(Rnd);
            }
            cnt++;
        } else {
            cnt = 0;
            i++;
        }
    } else if (Check) {
        txt = myName;
        Check = false;
    }
}
