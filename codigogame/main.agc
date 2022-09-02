
// Project: codigogame 
// Created: 2022-05-15

// mostra os erros
SetErrorMode(2)

// set window properties
SetWindowTitle( "codigogame" )
SetWindowSize( 1104, 621, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1104, 621 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 2 ) // since version 2.0.22 we can use nicer default fonts
//Fundo da tela
CreateSprite(LoadImage("cenario.png"))

//Carregar Imangens dos Personagens do Jogo
inimigos=CreateSprite(LoadImage("inimigos.png"))
inimigos1=CreateSprite(LoadImage("inimigos1.png"))
inimigos2=CreateSprite(LoadImage("inimigos2.png"))
inimigos3=CreateSprite(LoadImage("inimigos3.png"))
inimigos4=CreateSprite(LoadImage("inimigos4.png"))
personagem=CreateSprite(LoadImage("per.png"))
tiro=CreateSprite(LoadImage("tiro.png"))


//Ajustando na tela
y=Random(120,540)
y1=Random(120,540)
y2=Random(120,540)
y3=Random(120,540)
y4=Random(120,540)
SetSpritePosition(inimigos,900,y)
SetSpritePosition(inimigos1,100000,-100)
SetSpritePosition(inimigos2,100000,-100)
SetSpritePosition(inimigos3,100000,-100)
SetSpritePosition(inimigos4,100000,-100)
SetSpritePosition(personagem,1,310)
SetSpritePosition(tiro,10000,10000)

//Tamanho
SetSpriteSize(inimigos,130,100)
SetSpriteSize(inimigos1,130,100)
SetSpriteSize(inimigos2,130,100)
SetSpriteSize(inimigos3,130,100)
SetSpriteSize(inimigos4,130,100)
SetSpriteSize(personagem,130,100)

//shape das sprites
SetSpriteShape(inimigos,1)
SetSpriteShape(inimigos1,1)
SetSpriteShape(inimigos2,1)
SetSpriteShape(inimigos3,1)
SetSpriteShape(inimigos4,1)
SetSpriteShape(tiro,1)


//Animacao dos inimigos
SetSpriteAnimation(inimigos,200,300,2)
PlaySprite(inimigos,2,1,1,2)
SetSpriteAnimation(inimigos1,200,300,2)
PlaySprite(inimigos1,2,1,1,2)
SetSpriteAnimation(inimigos2,200,300,2)
PlaySprite(inimigos2,2,1,1,2)
SetSpriteAnimation(inimigos3,200,300,2)
PlaySprite(inimigos3,2,1,1,2)
SetSpriteAnimation(inimigos4,200,300,2)
PlaySprite(inimigos4,2,1,1,2)
//variaveis
pontos = 0
vidas = 3
wy=310
pei=0
tx=1
ty=0


//Laço Principal
do
    PrintC("PONTOS: ")
    Print(pontos)
    PrintC("VIDAS: ")
    Print(vidas)
    
    //movimento do inimigo
    SetSpritePosition(inimigos,GetSpriteX(inimigos)-5,y)
    if(GetSpriteX(inimigos)<1)
		y=Random(120,540)
		SetSpritePosition(inimigos,900,y)
		vidas=vidas-1
	endif
	
	
    // movimento
    SetJoystickScreenPosition(personagem,1,310)
    SetSpritePosition(personagem,1,wy)
    wy=wy+GetJoystickY()*12
    
    //limite da tela
    if (wy>540)
		wy=540
	endif
	if (wy<110)
		wy=110
	endif
	
	
    // tiro da arma
       if(GetPointerPressed()=1 and pei=0)
		tx=10
		ty=GetSpriteY(personagem)
		SetSpritePosition(tiro,tx,ty)
		pei=1
	endif
	if(pei=1)
		tx=tx+20
		SetSpritePosition(tiro,tx+63,ty+40)
	endif
	if(GetSpriteX(tiro)>1050)
		pei=0
        SetSpritePosition(tiro,10000,10000)
    endif
    
    
    //Colisão tiro com inimigos
    
    if GetSpriteCollision(inimigos,tiro)=1
		pontos=pontos+1
		y=Random(120,540)
		SetSpritePosition(inimigos,900,y)
		pei=0
		SetSpritePosition(tiro,10000,10000)
	endif
	
	if GetSpriteCollision(inimigos1,tiro)=1
		pontos=pontos+1
		y1=Random(120,540)
		SetSpritePosition(inimigos1,900,y1)
		pei=0
		SetSpritePosition(tiro,10000,10000)
	endif
	
	if GetSpriteCollision(inimigos2,tiro)=1
		pontos=pontos+1
		y2=Random(120,540)
		SetSpritePosition(inimigos2,900,y2)
		pei=0
		SetSpritePosition(tiro,10000,10000)
	endif
	
	if GetSpriteCollision(inimigos3,tiro)=1
		pontos=pontos+1
		y3=Random(120,540)
		SetSpritePosition(inimigos3,900,y3)
		pei=0
		SetSpritePosition(tiro,10000,10000)
	endif
	
	if GetSpriteCollision(inimigos4,tiro)=1
		pontos=pontos+1
		y4=Random(120,540)
		SetSpritePosition(inimigos4,900,y4)
		pei=0
		SetSpritePosition(tiro,10000,10000)
	endif
	
	//Mais Inimigos
	SetSpritePosition(inimigos1,GetSpriteX(inimigos1)-7,y1)
	if(GetSpriteX(inimigos1)<1)
		y1=Random(120,540)
		SetSpritePosition(inimigos1,900,y1)
		vidas=vidas-1
	endif
	if pontos=5
		SetSpritePosition(inimigos1,900,y1)
		SetSpriteVisible(inimigos1,0)
	elseif pontos>5
		SetSpriteVisible(inimigos1,1)
	endif
	
	SetSpritePosition(inimigos2,GetSpriteX(inimigos2)-8,y2)
	if(GetSpriteX(inimigos2)<1)
		y2=Random(120,540)
		SetSpritePosition(inimigos2,900,y2)
		vidas=vidas-1
	endif
	if pontos=15
		SetSpritePosition(inimigos2,900,y2)
		SetSpriteVisible(inimigos2,0)
	elseif pontos>15
		SetSpriteVisible(inimigos2,1)
	endif

	SetSpritePosition(inimigos3,GetSpriteX(inimigos3)-9,y3)
	if(GetSpriteX(inimigos3)<1)
		y3=Random(120,540)
		SetSpritePosition(inimigos3,900,y3)
		vidas=vidas-1
	endif
	if pontos=20
		SetSpritePosition(inimigos3,900,y3)
		SetSpriteVisible(inimigos3,0)
	elseif pontos>20
		SetSpriteVisible(inimigos3,1)
	endif
	
	SetSpritePosition(inimigos4,GetSpriteX(inimigos4)-10,y4)
	if(GetSpriteX(inimigos4)<1)
		y4=Random(120,540)
		SetSpritePosition(inimigos4,900,y4)
		vidas=vidas-1
	endif
	if pontos=30
		SetSpritePosition(inimigos4,900,y4)
		SetSpriteVisible(inimigos4,0)
	elseif pontos>30
		SetSpriteVisible(inimigos4,1)
	endif
    Sync()
loop
