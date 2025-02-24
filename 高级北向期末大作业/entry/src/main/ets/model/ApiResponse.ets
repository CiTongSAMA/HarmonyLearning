export interface ApiResponse {
  code: number;
  msg: string;
  data: Data;
  ok: boolean;
  error: boolean;
}

export interface Data {
  user: User;
  token: string;
}

export interface User {
  id: number;
  userId: number;
  createdTime?: Date | null; // 使用 '?' 表示该字段可能为 undefined 或 null，Date 类型是为了处理可能的日期时间数据
  username: string;
  accountName?: string | null;
  nickname: string;
  userType: string;
  sex?: string | null;
  email?: string | null;
  phoneNumber?: string | null;
  avatar?: string | null;
  deleteFlag: number;
  status: number;
  loginIp: string;
  loginDate?: Date | null;
  pwdUpdateTime?: Date | null;

}