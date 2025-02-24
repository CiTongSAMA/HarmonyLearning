import FieldDeviceItem from "./FieldDeviceItem";
import FieldStatusItem from "./FieldStatusItem";

export default class HomeModel {


  fieldStatus: FieldStatusItem; //农田状态
  fieldDevice: FieldDeviceItem; // 设备控制

  constructor() {
    this.fieldStatus = new FieldStatusItem();
    this.fieldDevice = new FieldDeviceItem();
  }







}