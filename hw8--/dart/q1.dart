abstract class SmartDevice {
  String name;
  bool isOn = false;

  SmartDevice(this.name);

  void turnOn() {
    isOn = true;
    print('$name is turned ON');
  }

  void turnOff() {
    isOn = false;
    print('$name is turned OFF');
  }
}

class Light extends SmartDevice {
  int brightness = 50;

  Light(String name) : super(name);

  void setBrightness(int level) {
    if (level < 0 || level > 100) {
      print('Brightness level should be between 0 and 100');
    } else {
      brightness = level;
      print('$name brightness set to $brightness%');
    }
  }
}

class AirConditioner extends SmartDevice {
  double temperature = 24.0;

  AirConditioner(String name) : super(name);

  void setTemperature(double temp) {
    temperature = temp;
    print('$name temperature set to $temperature°C');
  }
}

class SecurityCamera extends SmartDevice {
  bool motionDetected = false;

  SecurityCamera(String name) : super(name);

  void detectMotion() {
    motionDetected = true;
    print('$name detected motion!');
  }
}

class SmartHomeController {
  List<SmartDevice> devices = [];

  void addDevice(SmartDevice device) {
    devices.add(device);
  }

  void turnAllOn() {
    for (var device in devices) {
      device.turnOn();
    }
  }

  void turnAllOff() {
    for (var device in devices) {
      device.turnOff();
    }
  }
}

void main() {
  var light = Light('Living Room Light');
  var ac = AirConditioner('Bedroom AC');
  var camera = SecurityCamera('Front Door Camera');

  var homeController = SmartHomeController();
  homeController.addDevice(light);
  homeController.addDevice(ac);
  homeController.addDevice(camera);

  homeController.turnAllOn();
  light.setBrightness(80);
  ac.setTemperature(22.5);
  camera.detectMotion();

  homeController.turnAllOff();
}
