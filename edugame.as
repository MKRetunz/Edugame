package  {
	
	import flash.display.MovieClip;
	import flash.text.*;
	import flash.geom.ColorTransform;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.filters.GradientBevelFilter;
	import flash.media.H264Level;
	import flash.display3D.IndexBuffer3D;

	public class edugame extends MovieClip {
		//All vars
		
		var bg:Intro;
		var button:Play;
		var buttonOptions:Opties;
		var buttonGallerij:Gallerij;
		var buttonHowTo:HowToPlay;
		var buttonGeluid:Geluid;
		var HowTo:HowToPlayMenu;
		var optionsMenu:OptionsMenu;
		var gallerij:GallerijMenu;
		var returnButton:ReturnToMain;
		var creditsWin:EndScreen;
		
		public var ball:playerMC;
		
		var wall:gradient;
		
		var BlueWorld:Blue;
		var RedWorld:Red;
		var YellowWorld:Yellow;
		var goal:Finish;
		
		//Muren
		//Grijs
		var Gwall:PlatformG;
		
		//Geel
		var Ywall:PlatformY;
		var Ywall1:PlatformY1;
		var Ywall2:PlatformY2;
		
		//Rood
		var Rwall:PlatformR;
		var Rwall1:PlatformR1;
		var Rwall2:PlatformR2;
		
		//Blauw
		var Bwall1:PlatformB;
		var Bwall:PlatformB1;
		var Bwall2:PlatformB2;

		//booleans
		var jumps:Boolean;
		var goalhit:Boolean;
		
		var keyLeftPressed:Boolean;
		var keyRightPressed:Boolean;
		var spaceBarPressed:Boolean;
		
		var gameOver:Boolean;
		var buttonHit:Boolean;
		var onOff:Boolean;
		
		var buttonHowToScreen:Boolean;
		var buttonGeluidClick:Boolean;
		var buttonGallerijScreen:Boolean;
		var buttonOptionsScreen:Boolean;
		
		var buttonHover:Boolean;
		var buttonHover1:Boolean;
		var buttonHover2:Boolean;
		var buttonHover3:Boolean;
		var buttonHover4:Boolean;

		//ints
		var lives:int;
		var buttonId:int;
		var id:int;
		var stagespeed:int;
		var downspeed;int;
		var upspeed:int;
		var uptimer:int;
		var timer:int;

		public function edugame() {
			// constructor code
			onOff = false;
			
			//start screen
			bg = new Intro;
			button = new Play;
			buttonOptions = new Opties;
			buttonGallerij = new Gallerij;
			buttonHowTo = new HowToPlay;
			buttonGeluid = new Geluid;
			HowTo = new HowToPlayMenu;
			optionsMenu = new OptionsMenu;
			gallerij = new GallerijMenu;
			returnButton = new ReturnToMain;
			creditsWin = new EndScreen;
			
			//background
			wall = new gradient;
			
			//player
			ball = new playerMC();
			
			//all interactable objects
			BlueWorld = new Blue();
			RedWorld = new Red();
			YellowWorld = new Yellow();
			goal = new Finish();
			
			//Grijs
			Gwall = new PlatformG;
			
			//rood
			Rwall = new PlatformR;
			Rwall1 = new PlatformR1;
			Rwall2 = new PlatformR2;
			
			//Blauw
			Bwall1 = new PlatformB;
			Bwall = new PlatformB1;
			Bwall2 = new PlatformB2;
			
			//Geel
			Ywall = new PlatformY;
			Ywall1 = new PlatformY1;
			Ywall2 = new PlatformY2;

			
			//all Childs
			
			//startscreen
			stage.addChild(bg);
			stage.addChild(button);
			stage.addChild(buttonOptions);
			stage.addChild(buttonGallerij);
			stage.addChild(buttonHowTo);
			
			//All ints defined
			downspeed = 0;
			upspeed = 0;
			stagespeed = 0;
			
			//background location
			bg.x = 575;
			bg.y = 384;
			HowTo.x = 575;
			HowTo.y = 384;
			optionsMenu.x = 575;
			optionsMenu.y = 384;
			gallerij.x = 575;
			gallerij.y = 384;
			creditsWin.x = 475;
			creditsWin.y = 384;
			
			wall.x = 575;
			wall.y = 384;
			
			//buttons
			button.x = 375;
			button.y = 444;
			buttonOptions.x = 375;
			buttonOptions.y = 524;
			buttonGallerij.x = 375;
			buttonGallerij.y = 604;
			buttonHowTo.x = 375;
			buttonHowTo.y = 684;
			returnButton.x = 375;
			returnButton.y = 444;

			//color locations
			YellowWorld.x = 750;
			YellowWorld.y = 160;
			RedWorld.x = 650;
			RedWorld.y = 400;
			BlueWorld.x = 1250;
			BlueWorld.y = 400;
			
			//wall locations
			
			//Grijs
			Gwall.x = 200
			Gwall.y = 200;
			
			//Geel
			Ywall.x = 800
			Ywall.y = 440;
			Ywall1.x = 1880;
			Ywall1.y = 200;
			Ywall2.x = 2000;
			Ywall2.y = 440;
			
			//Rood
			Rwall.x = 200
			Rwall.y = 440;
			Rwall1.x = 1880;
			Rwall1.y = 440;
			Rwall2.x = 2120;
			Rwall2.y = 680
			
			//blauw
			Bwall.x = 200;
			Bwall.y = 680;
			Bwall1.x = 1160;
			Bwall1.y = 200;
			Bwall2.x = 1400;
			Bwall2.y = 680;
			
			//goal location
			goal.x = 1500;
			goal.y = 657;

			stage.addChild(buttonGeluid);
			
			buttonGeluid.x = 924;
			buttonGeluid.y = 100;
			
			//Events
			returnButton.addEventListener(MouseEvent.CLICK,returnToMain);
			returnButton.addEventListener(MouseEvent.MOUSE_OVER,hover);
			returnButton.addEventListener(MouseEvent.MOUSE_OUT,noHover);
			button.addEventListener(MouseEvent.CLICK,startGame);
			button.addEventListener(MouseEvent.MOUSE_OVER,hover1);
			button.addEventListener(MouseEvent.MOUSE_OUT,noHover1);
			buttonGeluid.addEventListener(MouseEvent.CLICK,geluidPlay);
			buttonGallerij.addEventListener(MouseEvent.CLICK,gallerijScreen);
			buttonGallerij.addEventListener(MouseEvent.MOUSE_OVER,hover2);
			buttonGallerij.addEventListener(MouseEvent.MOUSE_OUT,noHover2);
			buttonOptions.addEventListener(MouseEvent.CLICK,optionScreen);
			buttonOptions.addEventListener(MouseEvent.MOUSE_OVER,hover3);
			buttonOptions.addEventListener(MouseEvent.MOUSE_OUT,noHover3);
			buttonHowTo.addEventListener(MouseEvent.CLICK,howToScreen);
			buttonHowTo.addEventListener(MouseEvent.MOUSE_OVER,hover4);
			buttonHowTo.addEventListener(MouseEvent.MOUSE_OUT,noHover4);
			addEventListener(Event.ENTER_FRAME,onEnterFrameFunction);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyReleased);

			}

			function onEnterFrameFunction(event:Event) {
				//movement of background
				wall.x -= (stagespeed / 5);
				
				//movement of objects on stage	
				Gwall.x -= stagespeed;
				
				Ywall.x -= stagespeed;
				Ywall1.x -= stagespeed;
				Ywall2.x -= stagespeed;
				
				Rwall.x -= stagespeed;
				Rwall1.x -= stagespeed;
				Rwall2.x -= stagespeed;
				
				Bwall.x -= stagespeed;
				Bwall1.x -= stagespeed;
				Bwall2.x -= stagespeed;
				
				BlueWorld.x -= stagespeed;
				YellowWorld.x -= stagespeed;
				RedWorld.x -= stagespeed;
				goal.x -= stagespeed;
				
				id = ball.currentFrame;
				buttonId = buttonGeluid.currentFrame;
				
				//Play
				if (buttonGeluidClick) {
					if (buttonId == 1) {
						buttonGeluid.gotoAndStop(2);
					}
					if (buttonId == 2) {
						buttonGeluid.gotoAndStop(1);
					}
					buttonGeluidClick = false;
				}
				if (buttonOptionsScreen) {
					stage.addChild(optionsMenu);
					stage.addChild(returnButton);
					
					returnButton.x = 375;
					returnButton.y = 444;
					
					stage.addChild(button);
					stage.removeChild(button);
					stage.addChild(buttonOptions);
					stage.removeChild(buttonOptions);
					stage.addChild(buttonGallerij);
					stage.removeChild(buttonGallerij);
					stage.addChild(buttonHowTo);
					stage.removeChild(buttonHowTo);
					stage.addChild(bg);
					stage.removeChild(bg);
					
					stage.addChild(buttonGeluid);
					
					buttonOptionsScreen = false;
				}
				if (buttonHowToScreen) {
					stage.addChild(HowTo);
					stage.addChild(returnButton);
					
					returnButton.x = 175;
					returnButton.y = 100;
					
					stage.addChild(button);
					stage.removeChild(button);
					stage.addChild(buttonOptions);
					stage.removeChild(buttonOptions);
					stage.addChild(buttonGallerij);
					stage.removeChild(buttonGallerij);
					stage.addChild(buttonHowTo);
					stage.removeChild(buttonHowTo);
					stage.addChild(bg);
					stage.removeChild(bg);
					
					stage.addChild(buttonGeluid);
					
					buttonHowToScreen = false;
				}
				if (buttonGallerijScreen) {
					stage.addChild(gallerij);
					stage.addChild(returnButton);
					
					returnButton.x = 725;
					returnButton.y = 568;
					
					stage.addChild(button);
					stage.removeChild(button);
					stage.addChild(buttonOptions);
					stage.removeChild(buttonOptions);
					stage.addChild(buttonGallerij);
					stage.removeChild(buttonGallerij);
					stage.addChild(buttonHowTo);
					stage.removeChild(buttonHowTo);
					stage.addChild(bg);
					stage.removeChild(bg);
					
					stage.addChild(buttonGeluid);
					
					buttonGallerijScreen = false;
				}
				if (buttonHit) {
					onOff = true;
					stage.addChild(button);
					stage.removeChild(button);
					stage.addChild(buttonOptions);
					stage.removeChild(buttonOptions);
					stage.addChild(buttonGallerij);
					stage.removeChild(buttonGallerij);
					stage.addChild(buttonHowTo);
					stage.removeChild(buttonHowTo);
					stage.addChild(bg);
					stage.removeChild(bg);
					
					stage.addChild(wall);
			
					//colors
					stage.addChild(RedWorld);
					stage.addChild(YellowWorld);
					stage.addChild(BlueWorld);
					
					//goal
					stage.addChild(goal);
					
					//walls
					//Grijs
					stage.addChild(Gwall);
					
					//Geel
					stage.addChild(Ywall);
					stage.addChild(Ywall1);
					stage.addChild(Ywall2);
					
					//Blauw
					stage.addChild(Bwall);
					stage.addChild(Bwall1);
					stage.addChild(Bwall2);
					
					//Rood
					stage.addChild(Rwall);
					stage.addChild(Rwall1);
					stage.addChild(Rwall2);
					
					//color locations
					YellowWorld.x = 870;
					RedWorld.x = 650;
					BlueWorld.x = 1250;
					
					//wall locations
					
					//Grijs
					Gwall.x = 200;
							
					//Geel
					Ywall.x = 800;
					Ywall1.x = 1880;
					Ywall2.x =	2000;
							
					//Rood
					Rwall.x = 200;
					Rwall1.x = 1400;
					Rwall2.x = 2120;
							
					//blauw
					Bwall.x = 200;
					Bwall1.x = 1040;
					Bwall2.x = 1400;
					
					goal.x = 3000;
					
					stage.addChild(buttonGeluid);
					
					stage.addChild(returnButton);
					
					buttonGeluid.x = 924;
					buttonGeluid.y = 668;
					
					returnButton.x = 724;
					returnButton.y = 668;
					
					stage.addChild(ball);
					
					//player location
					ball.x = 350;
					ball.y = 50;
					
					//starting the game;
					stagespeed = 5;
					
					buttonHit = false;
				}
				
				//
				if (gameOver) {
					ball.gotoAndStop(1);
					wall.gotoAndStop(1);
					stagespeed = 0;
					
					buttonGeluid.x = 924;
					buttonGeluid.y = 100;
					
					jumps = false;
					
					button.x = 375;
					button.y = 444;
					buttonOptions.x = 375;
					buttonOptions.y = 524;
					buttonGallerij.x = 375;
					buttonGallerij.y = 604;
					buttonHowTo.x = 375;
					buttonHowTo.y = 684;
					
					stage.addChild(ball);
					stage.removeChild(ball);
					
					ball.x = 350;
					ball.y = 50;
					
					stage.addChild(gallerij);
					stage.removeChild(gallerij);
					stage.addChild(optionsMenu);
					stage.removeChild(optionsMenu);
					stage.addChild(HowTo);
					stage.removeChild(HowTo);
					stage.addChild(returnButton);
					stage.removeChild(returnButton);
					
					stage.addChild(bg);
					stage.addChild(button);
					stage.addChild(buttonOptions);
					stage.addChild(buttonGallerij);
					stage.addChild(buttonHowTo);
					
					stage.addChild(wall);
					stage.removeChild(wall);
					stage.addChild(creditsWin);
					stage.removeChild(creditsWin);
			
					//colors
					stage.addChild(RedWorld);
					stage.removeChild(RedWorld);
					stage.addChild(YellowWorld);
					stage.removeChild(YellowWorld);
					stage.addChild(BlueWorld);
					stage.removeChild(BlueWorld);
					
					//goal
					stage.addChild(goal);
					stage.removeChild(goal);
					
					//walls
					//Grijs
					stage.addChild(Gwall);
					stage.removeChild(Gwall);
					
					//Geel
					stage.addChild(Ywall);
					stage.removeChild(Ywall);
					stage.addChild(Ywall1);
					stage.removeChild(Ywall1);
					stage.addChild(Ywall2);
					stage.removeChild(Ywall2);
					
					//Blauw
					stage.addChild(Bwall);
					stage.removeChild(Bwall);
					stage.addChild(Bwall1);
					stage.removeChild(Bwall1);
					stage.addChild(Bwall2);
					stage.removeChild(Bwall2);

					//Rood
					stage.addChild(Rwall);
					stage.removeChild(Rwall);
					stage.addChild(Rwall1);
					stage.removeChild(Rwall1);
					stage.addChild(Rwall2);
					stage.removeChild(Rwall2);
					
					stage.addChild(buttonGeluid);
					
					
					onOff = false;
					gameOver = false;
				}
				
				//cosmetic effects
				if (buttonHover) {
					returnButton.gotoAndStop(2);
				}
				if (buttonHover1) {
					button.gotoAndStop(2);
				}
				if (buttonHover2) {
					buttonGallerij.gotoAndStop(2);
				}
				if (buttonHover3) {
					buttonOptions.gotoAndStop(2);
				}
				if (buttonHover4) {
					buttonHowTo.gotoAndStop(2);

				}
				if (buttonHover == false) {
					returnButton.gotoAndStop(1);
				}
				if (buttonHover1 == false) {
					button.gotoAndStop(1);
				}
				if (buttonHover2 == false) {
					buttonGallerij.gotoAndStop(1);
				}
				if (buttonHover3 == false) {
					buttonOptions.gotoAndStop(1);
				}
				if (buttonHover4 == false) {
					buttonHowTo.gotoAndStop(1);
				}
				
				//Movement
				if (onOff) {
					if(keyLeftPressed) {
						ball.x -= 10;
					}
					
					if (keyRightPressed) {
						ball.x += 5;
					}
					
					if(jumps == false ) {
						if (spaceBarPressed) {
						ball.y -= upspeed;
						uptimer++;
						timer = 0;
						downspeed = 7;
							if (uptimer > 10) {
								upspeed += 2
								uptimer -= 7;
							}
						}		
					}
					if (jumps == true) {
						ball.y += 4;
						uptimer = 0;
					}
					if (spaceBarPressed == false) {
						ball.y += downspeed;
						timer++;
						uptimer = 0;
						jumps = true;
						upspeed = 7;
						if (timer > 10) {
							downspeed += 1;
							timer -= 7;
					}
				}
				}
				//if the player hits the bottom of the level he loses
				if (ball.y > 768) {
					ball.y = 50;
					lives--;
					if (lives <= 0) {
						gameOver = true;
					}
				}
				
				//if the player touches the sides of the level he doesn't go off the screen;
				if (ball.x <= 50) {
					ball.x = 50;
				}
				if (ball.x >= 974) {
					ball.x = 974;
				}
				
				//Goal code
				if (ball.hitTestObject(goal)) {
					if(goalhit == false) {
						goalhit = true;
						stage.addChild(wall);
						stage.addChild(creditsWin);
						stage.addChild(returnButton);
						returnButton.x = 512;
						returnButton.y = 382;
					}
					onOff = false;
					stagespeed = 0;
					downspeed = -2;
				}
				
				//Color coding
				//Blue
				if (ball.hitTestObject(BlueWorld)) {
					ball.gotoAndStop(2);
					wall.gotoAndStop(2);
				}
				
				//Red
				if (ball.hitTestObject(RedWorld)) {
					ball.gotoAndStop(3);
					wall.gotoAndStop(3);
				}
				
				//Yellow
				if (ball.hitTestObject(YellowWorld)) {
					ball.gotoAndStop(4);
					wall.gotoAndStop(4);
				}
				
				//if the player hits the top of the level he drops back down
				if (ball.y < 0) {
					ball.y = 0;
					upspeed = -5;
					jumps = true;
				}
				//collision with walls and floor
				//Grey
				if (ball.hitTestObject(Gwall)) {
					if (id == 1){
						downspeed = 0;
						jumps = false;
						ball.y = Gwall.y - Gwall.height;
					}
				}

				//Yellow
				if (ball.hitTestObject(Ywall)) {
					if (id == 4){
						downspeed = 0;
						ball.y = Ywall.y - Ywall.height;
						jumps = false;
					}
				}
				if (ball.hitTestObject(Ywall1)) {
					if (id == 4){
						downspeed = 0;
						ball.y = Ywall1.y - Ywall1.height;
						jumps = false;
					}
				}
				if (ball.hitTestObject(Ywall2)) {
					if (id == 4){
						downspeed = 0;
						ball.y = Ywall2.y - Ywall2.height;
						jumps = false;
					}
				}
				

				//Blue
				if (ball.hitTestObject(Bwall)) {
					if (id == 2){
						downspeed = 0;
						ball.y = Bwall.y - Bwall.height;
						jumps = false;
					}
				}
				if (ball.hitTestObject(Bwall1)) {
					if (id == 2){
						downspeed = 0;
						ball.y = Bwall1.y - Bwall1.height;
						jumps = false;
					}
				}
				if (ball.hitTestObject(Bwall2)) {
					if (id == 2){
						downspeed = 0;
						ball.y = Bwall2.y - Bwall2.height;
						jumps = false;
					}
				}
				
				//Red
				if (ball.hitTestObject(Rwall)) {
					if (id == 3){
						downspeed = 0;
						ball.y = Rwall.y - Rwall.height;
						jumps = false;
					}
				}
				if (ball.hitTestObject(Rwall1)) {
					if (id == 3){
						downspeed = 0;
						ball.y = Rwall1.y - Rwall1.height;
						jumps = false;
					}
				}
				if (ball.hitTestObject(Rwall2)) {
					if (id == 3){
						downspeed = 0;
						ball.y = Rwall2.y - Rwall2.height;
						jumps = false;
					}
				}

			}
			
			function hover(event:MouseEvent) {
				buttonHover = true;
			}
			function noHover(event:MouseEvent) {
				buttonHover = false;
			}
			function hover1(event:MouseEvent) {
				buttonHover1 = true;
			}
			function noHover1(event:MouseEvent) {
				buttonHover1 = false;
			}
			function hover2(event:MouseEvent) {
				buttonHover2 = true;
			}
			function noHover2(event:MouseEvent) {
				buttonHover2 = false;
			}
			function hover3(event:MouseEvent) {
				buttonHover3 = true;
			}
			function noHover3(event:MouseEvent) {
				buttonHover3 = false;
			}
			function hover4(event:MouseEvent) {
				buttonHover4 = true;
			}
			function noHover4(event:MouseEvent) {
				buttonHover4 = false;
			}
			function startGame(event:MouseEvent) {
				buttonHit = true;
			}
			function returnToMain(event:MouseEvent) {
				gameOver = true;
			}
			function geluidPlay(event:MouseEvent) {
				buttonGeluidClick = true;
			}
			function optionScreen(event:MouseEvent) {
				buttonOptionsScreen = true;
			}
			function gallerijScreen(event:MouseEvent) {
				buttonGallerijScreen = true;
			}
			function howToScreen(event:MouseEvent) {
				buttonHowToScreen = true;
			}

			function keyReleased(event:KeyboardEvent) {
				if (event.keyCode == Keyboard.SPACE)
					spaceBarPressed = false;
				if (event.keyCode == Keyboard.LEFT)
					keyLeftPressed = false;
				if (event.keyCode == Keyboard.RIGHT)
					keyRightPressed = false;
				
			}

			function keyPressed(event:KeyboardEvent) {
				if (event.keyCode == Keyboard.SPACE)
					spaceBarPressed = true;
				if (event.keyCode == Keyboard.LEFT)
					keyLeftPressed = true;
				if (event.keyCode == Keyboard.RIGHT)
					keyRightPressed = true;
			}
		}
	}