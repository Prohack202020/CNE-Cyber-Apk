import flixel.FlxObject;
import hxvlc.flixel.FlxVideoSprite;
import funkin.backend.assets.ModsFolder;

var strumLerp = 2;
var strumOrder = [0, 1, 2, 3];
var strumPos = [[736, 50], [848, 50], [960, 50], [1072, 50]];
var strumPos2 = [[96, 50], [208, 50], [320, 50], [432, 50]];

function postCreate() {
    var index = members.indexOf(strumLines.members[0].characters[0]);
   
    main = new FlxSprite(-2500,-350).loadGraphic(Paths.image('stages/1stmap'));
     insert(index, main);
    
    main.visible = false;
}

function create() {
    dad.playAnim("start1");
}

function fadeOpp() {
	//face opponent notes out (for function 'mid()')
	for (i in 0...4) {
    		FlxTween.tween(cpuStrums.members[i], {alpha:0}, 1, {ease: FlxEase.smootherStepInOut});
		FlxTween.tween(cpuStrums.members[i], {x:-1000}, 1, {ease: FlxEase.smootherStepIn});
	}
}

function mid() {
	//middlescroll
	for (i in 0...4) {
    		FlxTween.tween(playerStrums.members[i], {x:425 + i * 105}, 1, {ease: FlxEase.quintInOut});
	}
}

function qMid() {
	//middlescroll
	for (s in strumLines.members[0]) {
        s.x = lerp(s.x, strumPos2[strumOrder[s.ID]][0], strumLerp);
        s.y = lerp(s.y, strumPos2[strumOrder[s.ID]][1], strumLerp);
    }

    for (s in strumLines.members[1]) {
        s.x = lerp(s.x, strumPos[strumOrder[s.ID]][0], strumLerp);
        s.y = lerp(s.y, strumPos[strumOrder[s.ID]][1], strumLerp);
    }
    
    for (i in 0...4) {
    	FlxTween.tween(cpuStrums.members[i], {alpha:1}, 0.1, {ease: FlxEase.smootherStepInOut});
    }
}

function stepHit()
{
    switch(curStep)
    {
        case 10:
            dad.playAnim("start2");
        case 780:
            main.visible = true;
            fadeOpp();
            mid();
        case 1550:
            main.visible = false;
        	qMid();
    }
}