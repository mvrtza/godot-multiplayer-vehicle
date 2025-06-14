extends RigidBody3D
@export var stop_car = false
@export var avaliable_gas = 10.0
@export var maximum_gas = 30.0
@export var distance_traveled = 0
@export var Debug_Mode :bool = false
@export var replicated_position : Vector3
@export var replicated_rotation : Vector3
@export var replicated_linear_velocity : Vector3
@export var replicated_angular_velocity : Vector3
# controls
@export var Use_Global_Control_Settings :bool = false
@export var UseMouseSteering :bool = false
@export var UseAccelerometreSteering :bool = false
@export var SteerSensitivity = 1.0
@export var KeyboardSteerSpeed = 0.025
@export var KeyboardReturnSpeed = 0.05
@export var KeyboardCompensateSpeed = 0.1

@export var SteerAmountDecay = 0.015 # understeer help
@export var SteeringAssistance = 1.0
@export var SteeringAssistanceAngular = 0.12

@export var LooseSteering :bool = false #simulate rack and pinion steering physics (EXPERIMENTAL)

@export var OnThrottleRate = 0.2
@export var OffThrottleRate = 0.2

@export var OnBrakeRate = 0.05
@export var OffBrakeRate = 0.1

@export var OnHandbrakeRate = 0.2
@export var OffHandbrakeRate = 0.2

@export var OnClutchRate = 0.2
@export var OffClutchRate = 0.2

@export var MaxThrottle = 1.0
@export var MaxBrake = 1.0
@export var MaxHandbrake = 1.0
@export var MaxClutch = 1.0

@export var GearAssistant = [
20, # Shift delay
2, # Assistance Level (0 - 2)
0.944087, # Speed Influence (will be automatically set)
6000.0, # Downshift RPM Iteration
6200.0, # Upshift RPM
3000.0, # Clutch-Out RPM
5, # throttle input allowed after shiting delay
]

# meta
@export var Controlled = true

# chassis
@export var Weight = 900.0 # kg

# body
@export var LiftAngle = 0.1
@export var DragCoefficient = 0.25
@export var Downforce = 0.0








#steering
@export var AckermannPoint = -3.8
@export var Steer_Radius = 13.0

#drivetrain
@export var Powered_Wheels :Array[String] = ["fl","fr"]

@export var FinalDriveRatio = 4.250
@export var GearRatios :Array[float] = [ 3.250, 1.894, 1.259, 0.937, 0.771 ]
@export var ReverseRatio = 3.153

@export var RatioMult = 9.5
@export var StressFactor = 1.0
@export var GearGap = 60.0
@export var DSWeight = 150.0 # Leave this be, unless you know what you're doing.

@export_enum("Fully Manual", "Automatic", "Continuously Variable", "Semi-Auto") var TransmissionType = 0

@export var AutoSettings = [
6500.0, # shift rpm (auto)
300.0, # downshift threshold (auto)
0.5, # throttle efficiency threshold (range: 0 - 1) (auto/dct)
0.0, # engagement rpm threshold (auto/dct/cvt)
4000.0, # engagement rpm (auto/dct/cvt)
]

@export var CVTSettings = [
0.75, # throttle efficiency threshold (range: 0 - 1)
0.025, # acceleration rate (range: 0 - 1)
0.9, # iteration 1 (higher = higher rpm)
500.0, # iteration 2 (higher = better acceleration from standstill but unstable)
2.0, # iteration 3 (higher = longer it takes to "lock" the rpm)
0.2, # iteration 4 (keep it over 0.1)
]




#stability
@export var ABS = [ # anti-lock braking system
2500.0, # threshold
1, # pump time
10, # vehicle speed before activation
true, # enabled
0.5, # pump force (0.0 - 1.0)
500.0, # lateral threshold
2, # lateral pump time
]

@export var ESP = [ # electronic stability program
0.5, # stabilisation theshold
1.5, # stabilisation rate (higher = understeer, understeer = inefficient)
1, # yaw threshold
3.0, # yaw rate
false, # enableda
]

@export var BTCS = [ # brake-based traction control system
10, # threshold
0.05, # sensitivity
false, # enabled
]

@export var TTCS = [ # throttle-based traction control system
5, # threshold
1.0, # sensitivity
false, # enabled
]


#differentials
@export var Locking = 0.1
@export var CoastLocking = 0.0
@export var Preload = 0.0

@export var Centre_Locking = 0.5
@export var Centre_CoastLocking = 0.5
@export var Centre_Preload = 0.0

#engine
@export var RevSpeed = 2.0 # Flywheel lightness
@export var EngineFriction = 18000.0
@export var EngineDrag = 0.006
@export var ThrottleResponse = 0.5
@export var DeadRPM = 100.0

#ECU
@export var RPMLimit = 7000.0
@export var LimiterDelay = 4
@export var IdleRPM = 800.0
@export var ThrottleLimit = 0.0
@export var ThrottleIdle = 0.25
@export var VVTRPM = 4500.0 # set this beyond the rev range to disable it, set it to 0 to use this vvt state permanently

#torque normal state
@export var BuildUpTorque = 0.0035
@export var TorqueRise = 30.0
@export var RiseRPM = 1000.0
@export var OffsetTorque = 110.0
@export var FloatRate = 0.1
@export var DeclineRate = 1.5
@export var DeclineRPM = 3500.0
@export var DeclineSharpness = 1.0

#torque @export variable valve timing triggered
@export var VVT_BuildUpTorque = 0.0
@export var VVT_TorqueRise = 60.0
@export var VVT_RiseRPM = 1000.0
@export var VVT_OffsetTorque = 70.0
@export var VVT_FloatRate = 0.1
@export var VVT_DeclineRate = 2.0
@export var VVT_DeclineRPM = 5000.0
@export var VVT_DeclineSharpness = 1.0

#clutch
@export var ClutchStable = 0.5
@export var GearRatioRatioThreshold = 200.0
@export var ThresholdStable = 0.01
@export var ClutchGrip = 176.125
@export var ClutchFloatReduction = 27.0

@export var ClutchWobble = 2.5*0
@export var ClutchElasticity = 0.2*0
@export var WobbleRate = 0.0

#forced inductions
@export var MaxPSI = 9.0 # Maximum air generated by any forced inductions
@export var EngineCompressionRatio = 8.0 # Piston travel distance
#turbo
@export var TurboEnabled = false # Enables turbo
@export var TurboAmount = 1 # Turbo power multiplication.
@export var TurboSize = 8.0 # Higher = More turbo lag
@export var Compressor = 0.3 # Higher = Allows more spooling on low RPM
@export var SpoolThreshold = 0.1 # Range: 0 - 0.9999
@export var BlowoffRate = 0.14
@export var TurboEfficiency = 0.075 # Range: 0 - 1
@export var TurboVacuum = 1.0 # Performance deficiency upon turbo idle
#supercharger
@export var SuperchargerEnabled = false # Enables supercharger
@export var SCRPMInfluence = 1.0
@export var BlowRate = 35.0
@export var SCThreshold = 6.0
@export var carskinname = 0
var last_distance = Vector3(0,0,0)
var rpm = 0.0
var rpmspeed = 0.0
var resistancerpm = 0.0
var resistancedv = 0.0
var gear = 0
var limdel = 0
var actualgear = 0
var gearstress = 0.0
var throttle = 0.0
var cvtaccel = 0.0
var sassistdel = 0
var sassiststep = 0
var clutchin = false
var gasrestricted = false
var revmatch = false
var gaspedal = 0.0
var brakepedal = 0.0
var clutchpedal = 0.0
var clutchpedalreal = 0.0
var steer = 0.0
var steer2 = 0.0
var abspump = 0.0
var tcsweight = 0.0
var tcsflash = false
var espflash = false
var ratio = 0.0
var vvt = false
var brake_allowed = 0.0
var readout_torque = 0.0

var brakeline = 0.0
var handbrakepull = 0.0
var dsweight = 0.0
var dsweightrun = 0.0
var diffspeed = 0.0
var diffspeedun = 0.0
var locked = 0.0
var c_locked = 0.0
var wv_difference = 0.0
var rpmforce = 0.0
var whinepitch = 0.0
var turbopsi = 0.0
var scrpm = 0.0
var boosting = 0.0
var rpmcs = 0.0
var rpmcsm = 0.0
var currentstable = 0.0
var steering_geometry = [0.0,0.0]
var resistance = 0.0
var wob = 0.0
var ds_weight = 0.0
var steer_torque = 0.0
var steer_velocity = 0.0
var drivewheels_size = 1.0

var steering_angles = []
var max_steering_angle = 0.0
var assistance_factor = 0.0



var pastvelocity = Vector3(0,0,0)
var gforce = Vector3(0,0,0)
var clock_mult = 1.0
var dist = 0.0
var stress = 0.0



var su = false
var sd = false
var gas = false
var horn = false
var brake = false
var handbrake = false
var right = false
var left = false
var clutch = false
var c_pws = []

var velocity = Vector3(0,0,0)
var rvelocity = Vector3(0,0,0)

var stalled = 0.0
func _enter_tree():
	set_multiplayer_authority(name.to_int())
func bullet_fix():
	var offset = $DRAG_CENTRE.position
	AckermannPoint -= offset.z
	
	for i in get_children():
		i.position -= offset

func _ready():
#	bullet_fix()
	rpm = IdleRPM
	for i in Powered_Wheels:
		var wh = get_node(str(i))
		c_pws.append(wh)
		


func controls():

	var mouseposx = 0.0
	
	if get_viewport().size.x>0.0:
		mouseposx = get_viewport().get_mouse_position().x/get_viewport().size.x
	
	if UseMouseSteering:
		gas = Input.is_action_pressed("gas_mouse")
		brake = Input.is_action_pressed("brake_mouse")
		su = Input.is_action_just_pressed("shiftup_mouse")
		sd = Input.is_action_just_pressed("shiftdown_mouse")
		handbrake = Input.is_action_pressed("handbrake_mouse")
	else:
		horn = Input.is_action_just_pressed("horn")
		gas = Input.is_action_pressed("gas")
		brake = Input.is_action_pressed("brake")
		su = Input.is_action_just_pressed("shiftup")
		sd = Input.is_action_just_pressed("shiftdown")
		handbrake = Input.is_action_pressed("handbrake")
	
	left = Input.is_action_pressed("left")
	right = Input.is_action_pressed("right")
	
	if left:
		steer_velocity -= 0.01
	elif right:
		steer_velocity += 0.01
	
	if LooseSteering:
		steer += steer_velocity

		if abs(steer)>1.0:
			steer_velocity *= -0.5

		for i in [$fl,$fr]:
			steer_velocity += (i.directional_force.x*0.00125)*i.Caster
			steer_velocity -= (i.stress*0.0025)*(atan2(abs(i.wv),1.0)*i.angle)
			
			steer_velocity += steer*(i.directional_force.z*0.0005)*i.Caster

			if i.position.x>0:
				steer_velocity += i.directional_force.z*0.0001
			else:
				steer_velocity -= i.directional_force.z*0.0001
		
			steer_velocity /= i.stress/(i.slip_percpre*(i.slip_percpre*100.0) +1.0) +1.0
			
	
	if Controlled:
		if GearAssistant[1] == 2:
			if gas and not gasrestricted and not gear == -1 or brake and gear == -1 or revmatch:
				gaspedal += OnThrottleRate/clock_mult
			else:
				gaspedal -= OffThrottleRate/clock_mult

			if brake and not gear == -1 or gas and gear == -1:
				brakepedal += OnBrakeRate/clock_mult
			else:
				brakepedal -= OffBrakeRate/clock_mult
		else:
			if GearAssistant[1] == 0:
				gasrestricted = false
				clutchin = false
				revmatch = false
			
			if gas and not gasrestricted or revmatch:
				gaspedal += OnThrottleRate/clock_mult
			else:
				gaspedal -= OffThrottleRate/clock_mult

			if brake:
				brakepedal += OnBrakeRate/clock_mult
			else:
				brakepedal -= OffBrakeRate/clock_mult

		if handbrake:
			handbrakepull += OnHandbrakeRate/clock_mult
		else:
			handbrakepull -= OffHandbrakeRate/clock_mult

		var siding = abs(velocity.x)

		if velocity.x>0 and steer2>0 or velocity.x<0 and steer2<0:
			siding = 0.0
			
		var going = velocity.z/(siding +1.0)
		if going<0:
			going = 0

		if not LooseSteering:
			if UseMouseSteering:
				steer2 = (mouseposx-0.5)*2.0
				steer2 *= SteerSensitivity
				if steer2>1.0:
					steer2 = 1.0
				elif steer2<-1.0:
					steer2 = -1.0
				
				var s = abs(steer2)*1.0 +0.5
				if s>1:
					s = 1
				
				steer2 *= s
			elif UseAccelerometreSteering:
				steer2 = Input.get_accelerometer().x/10.0
				steer2 *= SteerSensitivity
				if steer2>1.0:
					steer2 = 1.0
				elif steer2<-1.0:
					steer2 = -1.0
				
				var s = abs(steer2)*1.0 +0.5
				if s>1:
					s = 1
				
				steer2 *= s

			else:
				if right:
					if steer2>0:
						steer2 += KeyboardSteerSpeed
					else:
						steer2 += KeyboardCompensateSpeed
				elif left:
					if steer2<0:
						steer2 -= KeyboardSteerSpeed
					else:
						steer2 -= KeyboardCompensateSpeed
				else:
					if steer2>KeyboardReturnSpeed:
						steer2 -= KeyboardReturnSpeed
					elif steer2<-KeyboardReturnSpeed:
						steer2 += KeyboardReturnSpeed
					else:
						steer2 = 0.0
					
				if steer2>1.0:
					steer2 = 1.0
				elif steer2<-1.0:
					steer2 = -1.0
					
			if assistance_factor>0.0:
				var maxsteer = 1.0/(going*(SteerAmountDecay/assistance_factor) +1.0)
				
				var assist_commence = linear_velocity.length()/10.0
				if assist_commence>1.0:
					assist_commence = 1.0
				
				steer = (steer2*maxsteer) -(velocity.normalized().x*assist_commence)*(SteeringAssistance*assistance_factor) +rvelocity.y*(SteeringAssistanceAngular*assistance_factor)
			else:
				steer = steer2
func limits():
	if gaspedal<0.0:
		gaspedal = 0.0
	elif gaspedal>MaxThrottle:
		gaspedal = MaxThrottle

	if brakepedal<0.0:
		brakepedal = 0.0
	elif brakepedal>MaxBrake:
		brakepedal = MaxBrake

	if handbrakepull<0.0:
		handbrakepull = 0.0
	elif handbrakepull>MaxHandbrake:
		handbrakepull = MaxHandbrake

	if steer<-1.0:
		steer = -1.0
	elif steer>1.0:
		steer = 1.0

func transmission():
	
	su = Input.is_action_just_pressed("shiftup") and not UseMouseSteering or Input.is_action_just_pressed("shiftup_mouse") and UseMouseSteering
	sd = Input.is_action_just_pressed("shiftdown") and not UseMouseSteering or Input.is_action_just_pressed("shiftdown_mouse") and UseMouseSteering
	
	var clutch = Input.is_action_pressed("clutch") and not UseMouseSteering or Input.is_action_pressed("clutch_mouse") and UseMouseSteering
	if not GearAssistant[1] == 0:
		clutch = Input.is_action_pressed("handbrake") and not UseMouseSteering or Input.is_action_pressed("handbrake_mouse") and UseMouseSteering
	clutch = not clutch
	
	if TransmissionType == 0:
		if clutch and not clutchin:
			clutchpedalreal -= OffClutchRate/clock_mult
		else:
			clutchpedalreal += OnClutchRate/clock_mult
	
		if clutchpedalreal<0:
			clutchpedalreal = 0
		elif clutchpedalreal>MaxClutch:
			clutchpedalreal = MaxClutch
	
		clutchpedal = 1.0-clutchpedalreal

		if gear>0:
			ratio = GearRatios[gear-1]*FinalDriveRatio*RatioMult
		elif gear == -1:
			ratio = ReverseRatio*FinalDriveRatio*RatioMult
		
		if GearAssistant[1] == 0:
			if su:
				su = false
				if gear<len(GearRatios):
					if gearstress<GearGap:
						actualgear += 1
			if sd:
				sd = false
				if gear>-1:
					if gearstress<GearGap:
						actualgear -= 1
		elif GearAssistant[1] == 1:
			if rpm<GearAssistant[5]:
				var irga_ca = (GearAssistant[5]-rpm)/(GearAssistant[5]-IdleRPM)
				clutchpedalreal = irga_ca*irga_ca
				if clutchpedalreal>1.0:
					clutchpedalreal = 1.0
			else:
				if not gasrestricted and not revmatch:
					clutchin = false
			if su:
				su = false
				if gear<len(GearRatios):
					if rpm<GearAssistant[5]:
						actualgear += 1
					else:
						if actualgear<1:
							actualgear += 1
							if rpm>GearAssistant[5]:
								clutchin = false
						else:
							if sassistdel>0:
								actualgear += 1
							sassistdel = GearAssistant[0]/2.0
							sassiststep = -4

							clutchin = true
							gasrestricted = true
			elif sd:
				sd = false
				if gear>-1:
					if rpm<GearAssistant[5]:
						actualgear -= 1
					else:
						if actualgear == 0 or actualgear == 1:
							actualgear -= 1
							clutchin = false
						else:
							if sassistdel>0:
								actualgear -= 1
							sassistdel = GearAssistant[0]/2.0
							sassiststep = -2

							clutchin = true
							revmatch = true
							gasrestricted = false
		elif GearAssistant[1] == 2:
			var assistshiftspeed = (GearAssistant[4]/ratio)*GearAssistant[2]
			var assistdownshiftspeed = (GearAssistant[3]/abs((GearRatios[gear-2]*FinalDriveRatio)*RatioMult))*GearAssistant[2]
			if gear == 0:
				if gas:
					sassistdel -= 1
					if sassistdel<0:
						actualgear = 1
				elif brake:
					sassistdel -= 1
					if sassistdel<0:
						actualgear = -1
				else:
					sassistdel = 60
			elif linear_velocity.length()<5:
				if not gas and gear == 1 or not brake and gear == -1:
					sassistdel = 60
					actualgear = 0
			if sassiststep == 0:
				if rpm<GearAssistant[5]:
					var irga_ca = (GearAssistant[5]-rpm)/(GearAssistant[5]-IdleRPM)
					clutchpedalreal = irga_ca*irga_ca
					if clutchpedalreal>1.0:
						clutchpedalreal = 1.0
				else:
					clutchin = false
				if not gear == -1:
					if gear<len(GearRatios) and linear_velocity.length()>assistshiftspeed:
						sassistdel = GearAssistant[0]/2.0
						sassiststep = -4

						clutchin = true
						gasrestricted = true
					if gear>1 and linear_velocity.length()<assistdownshiftspeed:
						sassistdel = GearAssistant[0]/2.0
						sassiststep = -2

						clutchin = true
						gasrestricted = false
						revmatch = true

		if sassiststep == -4 and sassistdel<0:
			sassistdel = GearAssistant[0]/2
			if gear<len(GearRatios):
				actualgear += 1
			sassiststep = -3
		elif sassiststep == -3 and sassistdel<0:
			if rpm>GearAssistant[5]:
				clutchin = false
			if sassistdel<-GearAssistant[6]:
				sassiststep = 0
				gasrestricted = false
		elif sassiststep == -2 and sassistdel<0:
			sassiststep = 0
			if gear>-1:
				actualgear -= 1
			if rpm>GearAssistant[5]:
				clutchin = false
			gasrestricted = false
			revmatch = false


		gear = actualgear

	elif TransmissionType == 1:

		
		clutchpedal = (rpm- float(AutoSettings[3])*(gaspedal*float(AutoSettings[2]) +(1.0-float(AutoSettings[2]))) )/float(AutoSettings[4])
		
		
		if not GearAssistant[1] == 2:
			if su:
				su = false
				if gear<1:
					actualgear += 1
			if sd:
				sd = false
				if gear>-1:
					actualgear -= 1
		else:
			if gear == 0:
				if gas:
					sassistdel -= 1
					if sassistdel<0:
						actualgear = 1
				elif brake:
					sassistdel -= 1
					if sassistdel<0:
						actualgear = -1
				else:
					sassistdel = 60
			elif linear_velocity.length()<5:
				if not gas and gear == 1 or not brake and gear == -1:
					sassistdel = 60
					actualgear = 0
				
		if actualgear == -1:
			ratio = ReverseRatio*FinalDriveRatio*RatioMult
		else:
			ratio = GearRatios[gear-1]*FinalDriveRatio*RatioMult
		if actualgear>0:
			var lastratio = GearRatios[gear-2]*FinalDriveRatio*RatioMult
			su = false
			sd = false
			for i in c_pws:
				if (i.wv/GearAssistant[2])>(float(AutoSettings[0])*(gaspedal*float(AutoSettings[2]) +(1.0-float(AutoSettings[2]))))/ratio:
					su = true
				elif (i.wv/GearAssistant[2])<((float(AutoSettings[0])-float(AutoSettings[1]))*(gaspedal*float(AutoSettings[2]) +(1.0-float(AutoSettings[2])))) /lastratio:
					sd = true
					
			if su:
				gear += 1
			elif sd:
				gear -= 1
			if gear<1:
				gear = 1
			elif gear>len(GearRatios):
				gear = len(GearRatios)
		else:
			gear = actualgear
	elif TransmissionType == 2:

		
		clutchpedal = (rpm- float(AutoSettings[3])*(gaspedal*float(AutoSettings[2]) +(1.0-float(AutoSettings[2]))) )/float(AutoSettings[4])
		
#            clutchpedal = 1
		
		if not GearAssistant[1] == 2:
			if su:
				su = false
				if gear<1:
					actualgear += 1
			if sd:
				sd = false
				if gear>-1:
					actualgear -= 1
		else:
			if gear == 0:
				if gas:
					sassistdel -= 1
					if sassistdel<0:
						actualgear = 1
				elif brake:
					sassistdel -= 1
					if sassistdel<0:
						actualgear = -1
				else:
					sassistdel = 60
			elif linear_velocity.length()<5:
				if not gas and gear == 1 or not brake and gear == -1:
					sassistdel = 60
					actualgear = 0
				
		gear = actualgear
		var wv = 0.0        
		
		for i in c_pws:
			wv += i.wv/len(c_pws)
			
		cvtaccel -= (cvtaccel - (gaspedal*CVTSettings[0] +(1.0-CVTSettings[0])))*CVTSettings[1]

		var a = CVTSettings[4]/((abs(wv)/10.0)*cvtaccel +1.0)
		
		if a<CVTSettings[5]:
			a = CVTSettings[5]

		ratio = (CVTSettings[2]*10000000.0)/(abs(wv)*(rpm*a) +1.0)
		
		if ratio>CVTSettings[3]:
			ratio = CVTSettings[3]

	elif TransmissionType == 3:
		clutchpedal = (rpm- float(AutoSettings[3])*(gaspedal*float(AutoSettings[2]) +(1.0-float(AutoSettings[2]))) )/float(AutoSettings[4])

		if gear>0:
			ratio = GearRatios[gear-1]*FinalDriveRatio*RatioMult
		elif gear == -1:
			ratio = ReverseRatio*FinalDriveRatio*RatioMult
		
		if GearAssistant[1]<2:
			if su:
				su = false
				if gear<len(GearRatios):
					actualgear += 1
			if sd:
				sd = false
				if gear>-1:
					actualgear -= 1
		else:
			var assistshiftspeed = (GearAssistant[4]/ratio)*GearAssistant[2]
			var assistdownshiftspeed = (GearAssistant[3]/abs((GearRatios[gear-2]*FinalDriveRatio)*RatioMult))*GearAssistant[2]
			if gear == 0:
				if gas:
					sassistdel -= 1
					if sassistdel<0:
						actualgear = 1
				elif brake:
					sassistdel -= 1
					if sassistdel<0:
						actualgear = -1
				else:
					sassistdel = 60
			elif linear_velocity.length()<5:
				if not gas and gear == 1 or not brake and gear == -1:
					sassistdel = 60
					actualgear = 0
			if sassiststep == 0:
				if not gear == -1:
					if gear<len(GearRatios) and linear_velocity.length()>assistshiftspeed:
						actualgear += 1
					if gear>1 and linear_velocity.length()<assistdownshiftspeed:
						actualgear -= 1

		gear = actualgear

		

	if clutchpedal<0:
		clutchpedal = 0
	elif clutchpedal>1.0:
		clutchpedal = 1.0

func drivetrain():
			
		rpmcsm -= (rpmcs - resistance)

		rpmcs += rpmcsm*ClutchElasticity
		
		rpmcs -= rpmcs*(1.0-clutchpedal)
		
		wob = ClutchWobble*clutchpedal
		
		wob *= ratio*WobbleRate
		
		rpmcs -= (rpmcs - resistance)*(1.0/(wob +1.0))
		
#		torquereadout = multivariate(RiseRPM,TorqueRise,BuildUpTorque,EngineFriction,EngineDrag,OffsetTorque,rpm,DeclineRPM,DeclineRate,FloatRate,turbopsi,TurboAmount,EngineCompressionRatio,TurboEnabled,VVTRPM,VVT_BuildUpTorque,VVT_TorqueRise,VVT_RiseRPM,VVT_OffsetTorque,VVT_FloatRate,VVT_DeclineRPM,VVT_DeclineRate,SuperchargerEnabled,SCRPMInfluence,BlowRate,SCThreshold)
		if gear<0:
			rpm -= ((rpmcs*1.0)/clock_mult)*(RevSpeed/1.475)
		else:
			rpm += ((rpmcs*1.0)/clock_mult)*(RevSpeed/1.475)
				
		if "":
			rpm = 7000.0
			Locking = 0.0
			CoastLocking = 0.0
			Centre_Locking = 0.0
			Centre_CoastLocking = 0.0
			Preload = 1.0
			Centre_Preload = 1.0
			ClutchFloatReduction = 0.0
				
		gearstress = (abs(resistance)*StressFactor)*clutchpedal
		var stabled = ratio*0.9 +0.1
		ds_weight = DSWeight/stabled
		
		whinepitch = abs(rpm/ratio)*1.5
		
		if resistance>0.0:
			locked = abs(resistance/ds_weight)*(CoastLocking/100.0) + Preload
		else:
			locked = abs(resistance/ds_weight)*(Locking/100.0) + Preload
		
		if locked<0.0:
			locked = 0.0
		elif locked>1.0:
			locked = 1.0
			
			
		if wv_difference>0.0:
			c_locked = abs(wv_difference)*(Centre_CoastLocking/10.0) + Centre_Preload
		else:
			c_locked = abs(wv_difference)*(Centre_Locking/10.0) + Centre_Preload
		if c_locked<0.0 or len(c_pws)<4:
			c_locked = 0.0
		elif c_locked>1.0:
			c_locked = 1.0
			
		var maxd = VitaVehicleSimulation.fastest_wheel(c_pws)
		var mind = VitaVehicleSimulation.slowest_wheel(c_pws)
		var what = 0.0
		
		var floatreduction = ClutchFloatReduction

		if dsweightrun>0.0:
			floatreduction = ClutchFloatReduction/dsweightrun
		else:
			floatreduction = 0.0
				
		var stabling = -(GearRatioRatioThreshold -ratio*drivewheels_size)*ThresholdStable
		if stabling<0.0:
			stabling = 0.0
			
		currentstable = ClutchStable + stabling
		currentstable *= (RevSpeed/1.475)

		if dsweightrun>0.0:
			what = (rpm-(((rpmforce*floatreduction)*pow(currentstable,1.0))/(ds_weight/dsweightrun)))
		else:
			what = rpm
			
		if gear<0.0:
			dist = maxd.wv + what/ratio
		else:
			dist = maxd.wv - what/ratio
	
		dist *= (clutchpedal*clutchpedal)
		
		if gear == 0:
			dist *= 0.0

		wv_difference = 0.0
		drivewheels_size = 0.0
		for i in c_pws:
			drivewheels_size += i.w_size/len(c_pws)
			i.c_p = i.W_PowerBias
			wv_difference += ((i.wv - what/ratio)/(len(c_pws)))*(clutchpedal*clutchpedal)
			if gear<0:
				i.dist = dist*(1-c_locked) + (i.wv + what/ratio)*c_locked
			else:
				i.dist = dist*(1-c_locked) + (i.wv - what/ratio)*c_locked
			if gear == 0:
				i.dist *= 0.0
		GearAssistant[2] = drivewheels_size
		resistance = 0.0
		dsweightrun = dsweight
		dsweight = 0.0
		tcsweight = 0.0
		stress = 0.0

func aero():
	var drag = DragCoefficient
	var df = Downforce
	
#	var veloc = global_transform.basis.orthonormalized().xform_inv(linear_velocity)
	var veloc = global_transform.basis.orthonormalized().transposed() * (linear_velocity)
	
#	var torq = global_transform.basis.orthonormalized().xform_inv(Vector3(1,0,0))
	var torq = global_transform.basis.orthonormalized().transposed() * (Vector3(1,0,0))
	
#	apply_torque_impulse(global_transform.basis.orthonormalized().xform( Vector3(((-veloc.length()*0.3)*LiftAngle),0,0)  ) )
	apply_torque_impulse(global_transform.basis.orthonormalized() * ( Vector3(((-veloc.length()*0.3)*LiftAngle),0,0)  ) )
	
	var vx = veloc.x*0.15
	var vy = veloc.z*0.15
	var vz = veloc.y*0.15
	var vl = veloc.length()*0.15
	
#	var forc = global_transform.basis.orthonormalized().xform(Vector3(1,0,0))*(-vx*drag)
	var forc = global_transform.basis.orthonormalized() * (Vector3(1,0,0))*(-vx*drag)
#	forc += global_transform.basis.orthonormalized().xform(Vector3(0,0,1))*(-vy*drag)
	forc += global_transform.basis.orthonormalized() * (Vector3(0,0,1))*(-vy*drag)
#	forc += global_transform.basis.orthonormalized().xform(Vector3(0,1,0))*(-vl*df -vz*drag)
	forc += global_transform.basis.orthonormalized() * (Vector3(0,1,0))*(-vl*df -vz*drag)
	
	if has_node("DRAG_CENTRE"):
#		apply_impulse(global_transform.basis.orthonormalized().xform($DRAG_CENTRE.position),forc)
		apply_impulse(forc, global_transform.basis.orthonormalized() * ($DRAG_CENTRE.position))
	else:
		apply_central_impulse(forc)
		

func _physics_process(delta):
	if(avaliable_gas>0 && !stop_car):
		var sync_client_node = get_parent().get_node_or_null('ClientSync')
		distance_traveled += self.global_position.distance_to(last_distance) * 0.000001
		avaliable_gas -=  self.global_position.distance_to(last_distance)* 0.000001
		last_distance = self.global_position

#
		#if $detect_ground.is_colliding():
			#var ground = $detect_ground.get_collider()
			#await get_tree().create_timer(5.0).timeout 
			#if($detect_ground.is_colliding() && ground == $detect_ground.get_collider()):
				#rotation = Vector3(rotation.x,rotation.y,0)
		if sync_client_node:
			if len(steering_angles)>0:
				max_steering_angle = 0.0
				for i in steering_angles:
					max_steering_angle = maxf(max_steering_angle,i)
					
				assistance_factor = 90.0/max_steering_angle
			steering_angles = []
			
			if Use_Global_Control_Settings:
				UseMouseSteering = VitaVehicleSimulation.UseMouseSteering
				UseAccelerometreSteering = VitaVehicleSimulation.UseAccelerometreSteering
				SteerSensitivity = VitaVehicleSimulation.SteerAmountDecay
				KeyboardSteerSpeed = VitaVehicleSimulation.KeyboardSteerSpeed
				KeyboardReturnSpeed = VitaVehicleSimulation.KeyboardReturnSpeed
				KeyboardCompensateSpeed = VitaVehicleSimulation.KeyboardCompensateSpeed

				SteerAmountDecay = VitaVehicleSimulation.SteerAmountDecay
				SteeringAssistance = VitaVehicleSimulation.SteeringAssistance
				SteeringAssistanceAngular = VitaVehicleSimulation.SteeringAssistanceAngular
				
				GearAssistant[1] = VitaVehicleSimulation.GearAssistant

			
			if Input.is_action_just_pressed("toggle_debug_mode"):
				if Debug_Mode:
					Debug_Mode = false
				else:
					Debug_Mode = true
			
		#	velocity = global_transform.basis.orthonormalized().xform_inv(linear_velocity)
			velocity = global_transform.basis.orthonormalized().transposed() * (linear_velocity)
		#	rvelocity = global_transform.basis.orthonormalized().xform_inv(angular_velocity)
			rvelocity = global_transform.basis.orthonormalized().transposed() * (angular_velocity)

			if not mass == Weight/10.0:
				mass = Weight/10.0
			aero()
			
			gforce = (linear_velocity - pastvelocity)*((0.30592/9.806)*60.0)
			pastvelocity = linear_velocity
			
		#	gforce = global_transform.basis.orthonormalized().xform_inv(gforce)
			gforce = global_transform.basis.orthonormalized().transposed() * (gforce)
			
			controls()

			ratio = 10.0

			sassistdel -= 1

			transmission()
			
			limits()

			var steeroutput = steer
			
			var uhh = (max_steering_angle/90.0)*(max_steering_angle/90.0)
			uhh *= 0.5	
			steeroutput *= abs(steer)*(uhh) +(1.0-uhh)
			
			if abs(steeroutput)>0.0:
				steering_geometry = [-Steer_Radius/steeroutput,AckermannPoint]


			abspump -= 1    
			
			if abspump<0:
				brake_allowed += ABS[4]
			else:
				brake_allowed -= ABS[4]
				
			if brake_allowed<0.0:
				brake_allowed = 0.0
			elif brake_allowed>1.0:
				brake_allowed = 1.0
			
			brakeline = brakepedal*brake_allowed
			
			if brakeline<0.0:
				brakeline = 0.0
			
			limdel -= 1
			
			if limdel<0:
				throttle -= (throttle - (gaspedal/(tcsweight*clutchpedal +1.0)))*(ThrottleResponse/clock_mult)
			else:
				throttle -= throttle*(ThrottleResponse/clock_mult)

			if rpm>RPMLimit:
				if throttle>ThrottleLimit:
					throttle = ThrottleLimit
					limdel = LimiterDelay
			elif rpm<IdleRPM:
				if throttle<ThrottleIdle:
					throttle = ThrottleIdle


			var stab = 300.0


			var thr = 0.0

			if TurboEnabled:
				thr = (throttle-SpoolThreshold)/(1-SpoolThreshold)
					
				if boosting>thr:
					boosting = thr
				else:
					boosting -= (boosting - thr)*TurboEfficiency
				
				turbopsi += (boosting*rpm)/((TurboSize/Compressor)*60.9)

				turbopsi -= turbopsi*BlowoffRate
					
				if turbopsi>MaxPSI:
					turbopsi = MaxPSI
					
				if turbopsi<-TurboVacuum:
					turbopsi = -TurboVacuum
			elif SuperchargerEnabled:
				scrpm = rpm*SCRPMInfluence
				turbopsi = (scrpm/10000.0)*BlowRate -SCThreshold
				if turbopsi>MaxPSI:
					turbopsi = MaxPSI
				if turbopsi<0.0:
					turbopsi = 0.0
			else:
				turbopsi = 0.0

			vvt = rpm>VVTRPM
			
			var torque = 0.0
			
				
			if vvt:
				var f = rpm-VVT_RiseRPM
				if f<0.0:
					f = 0.0
				torque = (rpm*VVT_BuildUpTorque +VVT_OffsetTorque + (f*f)*(VVT_TorqueRise/10000000.0))*throttle
				torque += ( (turbopsi*TurboAmount) * (EngineCompressionRatio*0.609) )
				var j = rpm-VVT_DeclineRPM
				if j<0.0:
					j = 0.0
				torque /= (j*(j*VVT_DeclineSharpness +(1.0-VVT_DeclineSharpness)))*(VVT_DeclineRate/10000000.0) +1.0
				torque /= abs(rpm*abs(rpm))*(VVT_FloatRate/10000000.0) +1.0
			else:
				var f = rpm-RiseRPM
				if f<0.0:
					f = 0.0
				torque = (rpm*BuildUpTorque +OffsetTorque + (f*f)*(TorqueRise/10000000.0))*throttle
				torque += ( (turbopsi*TurboAmount) * (EngineCompressionRatio*0.609) )
				var j = rpm-DeclineRPM
				if j<0.0:
					j = 0.0
				torque /= (j*(j*DeclineSharpness +(1.0-DeclineSharpness)))*(DeclineRate/10000000.0) +1.0
				torque /= abs(rpm*abs(rpm))*(FloatRate/10000000.0) +1.0
				
			rpmforce = (rpm/(abs(rpm*abs(rpm))/(EngineFriction/clock_mult) +1.0))*1.0
			if rpm<DeadRPM:
				torque = 0.0
				rpmforce /= 5.0
				stalled = 1.0 -rpm/DeadRPM
			else:
				stalled = 0.0
			rpmforce += (rpm*(EngineDrag/clock_mult))*1.0
			rpmforce -= (torque/clock_mult)*1.0
			rpm -= rpmforce*RevSpeed
				
			drivetrain()

var front_wheels = []
var rear_wheels = []
var front_load = 0.0
var total = 0.0

var weight_dist = [0.0,0.0]

func _process(delta):
	if Debug_Mode:
		front_wheels = []
		rear_wheels = []
		for i in get_children():
			if "TyreSettings" in i:
				if i.position.z>0:
					front_wheels.append(i)
				else:
					rear_wheels.append(i)
					
		front_load = 0.0
		total = 0.0
		
		for f in front_wheels:
			front_load += f.directional_force.y
			total += f.directional_force.y
		for r in rear_wheels:
			front_load -= r.directional_force.y
			total += r.directional_force.y
			
		if total>0:
			weight_dist[0] = (front_load/total)*0.5 +0.5
			weight_dist[1] = 1.0-weight_dist[0]
	var sync_client_node = get_parent().get_node_or_null('ClientSync')
	if sync_client_node:
		readout_torque = VitaVehicleSimulation.multivariate(RiseRPM,TorqueRise,BuildUpTorque,EngineFriction,EngineDrag,OffsetTorque,rpm,DeclineRPM,DeclineRate,FloatRate,MaxPSI,TurboAmount,EngineCompressionRatio,TurboEnabled,VVTRPM,VVT_BuildUpTorque,VVT_TorqueRise,VVT_RiseRPM,VVT_OffsetTorque,VVT_FloatRate,VVT_DeclineRPM,VVT_DeclineRate,SuperchargerEnabled,SCRPMInfluence,BlowRate,SCThreshold,DeclineSharpness,VVT_DeclineSharpness)
	
func _integrate_forces(_state : PhysicsDirectBodyState3D) -> void:
	var sync_client_node = get_parent().get_node_or_null('ClientSync')
	var sync_server_node = get_parent().get_node_or_null('ServerSync')
	if sync_client_node:
		replicated_position = position
		replicated_rotation = rotation
		replicated_linear_velocity = linear_velocity
		replicated_angular_velocity = angular_velocity
	if sync_server_node:
		position = replicated_position
		rotation = replicated_rotation
		linear_velocity = replicated_linear_velocity
		angular_velocity = replicated_angular_velocity
	
	
