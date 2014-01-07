$(document).ready(function(){
    if($(".thriller").length > 0){
        var webStorage = typeof(Storage) !== "undefined";
        lawl = new makeTheThriller();
        for(var i = 1; i <=24; i++){
            var val = "";
            if(webStorage)
                val = localStorage.getItem("entry" + i)?localStorage.getItem("entry" + i):"";
            $("div#page2").append(
                i+': <input type="text" id="entry'+i+'" class="bieruhr_entry" value="'+val+'"/>'
            );
        }

        $(".bieruhr_entry").on("focusout", function(){
            console.log("out");
            if(webStorage)
                for(var i = 1; i <= 24; i++){
                    localStorage.setItem("entry" + i, $("#entry"+i).val());
                }
        });
    }
});

mapper = function(i) {
    var a = new Array();
    a[1] = 1;
    a[2] = 22;
    a[3] = 18;
    a[4] = 2;
    a[5] = 5;
    a[6] = 16;
    a[7] = 24;
    a[8] = 8;
    a[9] = 20;
    a[10] = 15;
    a[11] = 4;
    a[12] = 12;
    a[13] = 21;
    a[14] = 14;
    a[15] = 23;
    a[16] = 11;
    a[17] = 6;
    a[18] = 19;
    a[19] = 17;
    a[20] = 9;
    a[21] = 3;
    a[22] = 10;
    a[23] = 13;
    a[24] = 7;
    return a[i];
}

makeTheThriller = function() {
    var mouseDown = false;
    var startX;
    var startY;
    var thriller = $(".thriller");
    var result = $("#result");
    var centerX = thriller.width()/2 + thriller.offset().left;
    var centerY = thriller.height()/2 + thriller.offset().top;
    var rotation = 0;
    var deltaRot = 0;
    var oldX = 0;
    var oldY = 0;
    var startRot = 0;
    var friction = 0.98;
    var frictionConst = 0.001;
    var accel = 0.8;
    var rid = Math.PI * 2 / 24;
    var self = this;

    this.getPosition = function() {
        if(rotation == 0)
            return 1;
        return 25 - Math.ceil(rotation / rid);
    }

    this.getPositionMapped = function(){
        return mapper(this.getPosition());
    }

    thriller.on("mousedown", function(e){
        e.preventDefault();
        inputDown(e);
    }).on("mouseup",function(e){
        e.preventDefault();
        inputUp(e);
    }).on("mousemove",function(e){
        e.preventDefault();
        inputMove(e);
    }).on("mouseout",function(e){
        e.preventDefault();
        inputUp(e);
    }).on("touchstart", function(e){
        e.preventDefault();
        inputDown(e.originalEvent.changedTouches[0]);
    }).on("touchmove", function(e){
        e.preventDefault();
        inputMove(e.originalEvent.changedTouches[0]);
    }).on("touchend", function(e){
        e.preventDefault();
        inputUp(e.originalEvent.changedTouches[0]);
    });

    var inputUp = function(e){
        mouseDown = false;
    };

    var inputDown = function(e){
        startX = e.pageX - centerX;
        startY = e.pageY - centerY;
        deltaRot = 0;
        startRot = rotation;
        mouseDown = true;
    } ;

    var inputMove = function(e){
        if(mouseDown){

            var nowX = e.pageX - centerX;
            var nowY = e.pageY - centerY;
            var startRad = Math.atan2(startY, startX);
            var endRad = Math.atan2(nowY, nowX);
            var oldRad = Math.atan2(oldY, oldX);
            deltaRot = (endRad - oldRad) * accel;
            if(typeof deltaRot == "undefined")
                deltaRot = 0;
            oldX = nowX;
            oldY = nowY;
            setRotation(thriller, startRot + endRad - startRad);
        }
    };


    var rotate = function(e, rad){
        rotation += rad;
        setRotation(e, rotation)
    };

    var setRotation = function(e, rad){
        rotation = rad;
        rotation = (rotation + Math.PI * 2 ) % (Math.PI * 2);
        if(deltaRot == 0)
            result.html(self.getPositionMapped()+": "+$("#entry"+self.getPositionMapped()).val());
        else
            result.html(" ");

        e.css('transform', 'rotate(' + rad + 'rad)');
        e.css('-ms-transform', 'rotate(' + rad + 'rad)');
        e.css('-webkit-transform', 'rotate(' + rad + 'rad)');
    }

    setInterval(function(){
        if(! mouseDown){
            rotate(thriller, deltaRot);
            deltaRot *= friction;
            if(deltaRot > 0)
                deltaRot -= frictionConst;
            if(deltaRot < 0)
                deltaRot += frictionConst;
            if(Math.abs(deltaRot) < 0.0005)
                deltaRot = 0;
        }
    }, 60);
};
