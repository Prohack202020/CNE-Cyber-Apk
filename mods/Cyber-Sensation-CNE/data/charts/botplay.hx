import funkin.game.PlayState;
import funkin.backend.utils.NativeAPI;
var botplaytxt:FunkinText;
var speed:Float = 1;
function postCreate(){
    botplaytxt = new FunkinText(525, 547, 0, "BOTPLAY", 24, true);
    botplaytxt.visible = false;
    botplaytxt.screenCenter(FlxAxes.X);
	botplaytxt.cameras = [camHUD];
	add(botplaytxt);
}

function update(elapsed:Float) {
    if(controls.ACCEPT)
        {
            playerStrums.cpu = !playerStrums.cpu;
            botplaytxt.visible = !botplaytxt.visible;
        }
    

        if (FlxG.keys.pressed.ONE) speed -= 0.01;
        if (FlxG.keys.justPressed.TWO) speed = 1;
        if (FlxG.keys.pressed.THREE) speed += 0.01;
        if (FlxG.keys.pressed.FIVE) PlayState.instance.endSong();
                
        if (FlxG.keys.justPressed.O) NativeAPI.allocConsole();

        //TODO: make it work with note miss effects
        FlxG.timeScale = inst.pitch = vocals.pitch = speed;
        
}


PauseSubState.script = 'data/scripts/pause';

function destroy() {
    FlxG.timeScale = 1;
}
