export default class LoginUser {

  id:number;
  userId: number;
  username:string;
  nickname:string;
  sex: string;
  email:string;
  phoneNumber:string;
  token:string;

  constructor(id: number, userId: number, username: string,
    nickname: string, sex: string, email: string,
    phoneNumber: string, token: string) {
    this.id = id;
    this.userId = userId;
    this.username = username;
    this.nickname = nickname;
    this.sex = sex;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.token = token;
  }








}