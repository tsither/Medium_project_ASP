structure("ROOT").
feature("ROOT","Forehand","rubberColor",1,1).
feature("ROOT","Backhand","rubberColor",1,1).
feature("ROOT","Rubbers","rubberMaterial",1,1).
feature("ROOT","Style","Style",1,1).
feature("ROOT","BladeMaterial","bladeMaterial",2,2).
feature("ROOT","BladeShape","bladeShape",2,2).
feature("ROOT","Grip","grip",3,3).
feature("ROOT","Lucky","luck",3,3).
feature("ROOT","SpongeWidth","spongeWidth",3,3).

enumeration("Style").
option("Style", "Offensive").
option("Style", "Defensive").
option("Style", "Custom").

enumeration("rubberColor").
option("rubberColor", "Red").
option("rubberColor", "Black").
option("rubberColor", "Pink").
option("rubberColor", "Blue").

enumeration("rubberMaterial").
option("rubberMaterial", "Inverted").
option("rubberMaterial", "Short_Pips").
option("rubberMaterial", "Long_Pips").
option("rubberMaterial", "Anti_topspin").

enumeration("spongeWidth").
attribute("spongeWidth","mm").
option("spongeWidth", "'1.8mm (fastest)'").
attr_value("spongeWidth","'1.8mm (fastest)'","mm",18).
option("spongeWidth", "'2.0mm (faster)'").
attr_value("spongeWidth","'2.0mm (faster)'","mm",20).
option("spongeWidth", "'2.2mm (slower)'").
attr_value("spongeWidth","'2.2mm (slower)'","mm",22).
option("spongeWidth", "'2.3mm (slowest)'").
attr_value("spongeWidth","'2.3mm (slowest)'","mm",23).

enumeration("bladeMaterial").
option("bladeMaterial", "Wood").
option("bladeMaterial", "Carbon_fiber").

enumeration("bladeShape").
option("bladeShape", "Cyber").
option("bladeShape", "Elliptical").

enumeration("grip").
option("grip", "Yes").
option("grip", "No").

enumeration("luck").
option("luck", "Yes").
option("luck", "No").

behavior(("ROOT",0)).
require(("ROOT",0),"Forehand!=Backhand").
binary("ROOT","Forehand!=Backhand","Forehand","!=","Backhand").
constant("Forehand").
constant("Backhand").

behavior(("ROOT",1)).
condition(("ROOT",1),"Style=Offensive").
binary("ROOT","Style=Offensive","Style","=","Offensive").
constant("Style").
constant("Offensive").
require(("ROOT",1),"BladeShape=Cyber").
binary("ROOT","BladeShape=Cyber","BladeShape","=","Cyber").
constant("BladeShape").
constant("Cyber").

behavior(("ROOT",2)).
condition(("ROOT",2),"Style=Offensive").
binary("ROOT","Style=Offensive","Style","=","Offensive").
constant("Style").
constant("Offensive").
require(("ROOT",2),"BladeMaterial=Carbon_fiber").
binary("ROOT","BladeMaterial=Carbon_fiber","BladeMaterial","=","Carbon_fiber").
constant("BladeMaterial").
constant("Carbon_fiber").

behavior(("ROOT",3)).
condition(("ROOT",3),"Style=Offensive").
binary("ROOT","Style=Offensive","Style","=","Offensive").
constant("Style").
constant("Offensive").
require(("ROOT",3),"Rubbers=Inverted").
binary("ROOT","Rubbers=Inverted","Rubbers","=","Inverted").
constant("Rubbers").
constant("Inverted").

behavior(("ROOT",4)).
condition(("ROOT",4),"Style=Offensive").
binary("ROOT","Style=Offensive","Style","=","Offensive").
constant("Style").
constant("Offensive").
require(("ROOT",4),"SpongeWidth='1.8mm (fastest)'").
binary("ROOT","SpongeWidth='1.8mm (fastest)'","SpongeWidth","=","'1.8mm (fastest)'").
constant("SpongeWidth").
path("'1.8mm (fastest)'",0,"'1.8mm (fastest)'").

behavior(("ROOT",5)).
condition(("ROOT",5),"Style=Defensive").
binary("ROOT","Style=Defensive","Style","=","Defensive").
constant("Style").
constant("Defensive").
require(("ROOT",5),"BladeShape=Elliptical").
binary("ROOT","BladeShape=Elliptical","BladeShape","=","Elliptical").
constant("BladeShape").
constant("Elliptical").

behavior(("ROOT",6)).
condition(("ROOT",6),"Style=Defensive").
binary("ROOT","Style=Defensive","Style","=","Defensive").
constant("Style").
constant("Defensive").
require(("ROOT",6),"BladeMaterial=Wood").
binary("ROOT","BladeMaterial=Wood","BladeMaterial","=","Wood").
constant("BladeMaterial").
constant("Wood").

behavior(("ROOT",7)).
condition(("ROOT",7),"Style=Defensive").
binary("ROOT","Style=Defensive","Style","=","Defensive").
constant("Style").
constant("Defensive").
require(("ROOT",7),"Rubbers=Long_Pips").
binary("ROOT","Rubbers=Long_Pips","Rubbers","=","Long_Pips").
constant("Rubbers").
constant("Long_Pips").

behavior(("ROOT",8)).
condition(("ROOT",8),"Style=Defensive").
binary("ROOT","Style=Defensive","Style","=","Defensive").
constant("Style").
constant("Defensive").
require(("ROOT",8),"SpongeWidth='2.3mm (slowest)'").
binary("ROOT","SpongeWidth='2.3mm (slowest)'","SpongeWidth","=","'2.3mm (slowest)'").
constant("SpongeWidth").
path("'2.3mm (slowest)'",0,"'2.3mm (slowest)'").

behavior(("ROOT",9)).
combinations(("ROOT",9),0,"Lucky").
combinations(("ROOT",9),1,"Grip").
% constant("Lucky").
% constant("Grip").
path("Lucky",0,"Lucky").
path("Grip",1,"Grip").
allow(("ROOT",9),(0,0),"Yes").
allow(("ROOT",9),(1,0),"No").
allow(("ROOT",9),(0,1),"No").
allow(("ROOT",9),(1,1),"Yes").


% combinations(("ROOT",1),0,"wheelSupport").
% combinations(("ROOT",1),1,"Grip").
% path("wheelSupport",0,"wheelSupport").
% path("rearWheel",0,"rearWheel").
% allow(("ROOT",1),(0,0),"True").
% allow(("ROOT",1),(1,0),"W14").
% allow(("ROOT",1),(1,0),"W16").
% allow(("ROOT",1),(0,1),"False").
% allow(("ROOT",1),(1,1),"W18").
% allow(("ROOT",1),(1,1),"W20").