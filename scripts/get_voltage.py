#!/usr/bin/env python

import rospy
from uchile_rqt_batteries.battery_publisher import VoltageBatteryStatePublisher
from dynamixel_msgs.msg import MotorStateList


def voltage_cb(msg):
        # Check motor list
        if not msg.motor_states:
            return
        # Average voltage
        sum_voltage = 0.0
        for motor in msg.motor_states:    
            sum_voltage += motor.voltage
        voltage = sum_voltage/len(msg.motor_states)
        # Proportional voltage
        print voltage

        voltage1=msg.motor_states[0].voltage
        time=msg.motor_states[0].timestamp
        print str(voltage1) + " " + str(time)          

def main():
    rospy.init_node('get_voltage', anonymous=True)
    
    voltage_sub = rospy.Subscriber('/bender/motor_states/l_port', MotorStateList, voltage_cb)

    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException: 
        pass
