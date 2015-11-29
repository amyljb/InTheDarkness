local composer = require( "composer" )
local tap = audio.loadSound( "Sounds/click.mp3" )
local changePage = {}
--options table for next page transitions
local options = {
    effect = "crossFade",
    time = 2000
}

function changePage.loadPrevious(previousScene, movedPage)
    movedPage = true
    print("loading previous")
    composer.gotoScene( previousScene, options )
   
end

function changePage.loadNext(overlayOptions, movedPage)
    movedPage = true
    print("loading Next")
    composer.gotoScene( "scenes.textPage", overlayOptions )
   
end

return changePage

