package ;
import luxe.Color;
import luxe.Input;
import luxe.Parcel;
import luxe.ParcelProgress;
import luxe.resource.Resource;

class Main extends luxe.Game {

    override function ready() {
    	// load the parcel
        Luxe.resources.load_json('assets/parcel.json').then(function(json:JSONResource) {
            var parcel = new Parcel();
            parcel.from_json(json.asset.json);

            // show a loading bar
            //new ParcelProgress({
            new DigitalCircleParcelProgress({
                parcel: parcel,
                oncomplete: assetsLoaded
            });
            
            // start loading!
            parcel.load();
        });

    } //ready

    function assetsLoaded(_) {
		Luxe.audio.create('assets/music/Small_Sleepy_Town.mp3', 'sleepy_town').then(
			function(_) {
				Luxe.audio.loop('sleepy_town');
			},
			function(reason) {
				trace('Failed to load music: $reason');
			}
		);

    	new luxe.Text({
    		text: 'Music: \'Meloncholy Town\' by VWolfdog (opengameart.org)',
    		align: center,
    		align_vertical: center,
    		point_size: 12,
    		pos: Luxe.screen.mid,
    		color: new Color().rgb(0x4ECDC4)
    	});
    }

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

    } //update


} //Main
