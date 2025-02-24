import { http } from "@kit.NetworkKit";
import { ApiResponse } from "./ApiResponse";
import LoginParam from "./LoginParam";
import LoginUser from "./LoginUser";



const  loginUrl = 'http://117.78.16.25:9999/api/login';

const TAG = '[8888 LoginModel]'


class Header {
  public  contentType:string;

  constructor(contentType: string) {
    this.contentType = contentType;
  }

}


export default class LoginModel {
  login(userName: string, pwd: string): Promise<string> {

    let message = '';

    console.info(TAG, 'in login')


    let data: LoginParam = {
      username: userName,
      password: pwd
    }


    let httpRequest = http.createHttp();

    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      connectTimeout: 60000,
      readTimeout: 60000,
      header: new Header('application/json'),
      extraData: data
    }
    console.info(TAG, 'in login4444')
    return new Promise((resolve: (value: string) => void, reject: (reason?: string) => void) => {
      httpRequest.request(loginUrl, options).then((data: http.HttpResponse) => {

        console.info(TAG, `data:${data.responseCode}`)
        console.info(TAG, `data:${data.result}`)

        if (data.responseCode === 200) {

          let apiResponse: ApiResponse = JSON.parse(`${data.result}`)

          console.info(TAG, `apiresponse:${JSON.stringify(apiResponse)}`)
          if (apiResponse.code === 20000) {
            console.info(TAG, `data:${JSON.stringify(apiResponse.data)}`)

            let loginUser: LoginUser = new LoginUser(0, 0, '', '', '', '', '', '');

            loginUser.id = apiResponse.data.user.id;
            loginUser.userId = apiResponse.data.user.userId;
            loginUser.username = apiResponse.data.user.username;
            loginUser.nickname = apiResponse.data.user.nickname;
            loginUser.sex = apiResponse.data.user.sex as string;
            loginUser.email = apiResponse.data.user.email as string;
            loginUser.phoneNumber = apiResponse.data.user.phoneNumber as string;
            loginUser.token = apiResponse.data.token;
            console.info(TAG, `losginUser:${JSON.stringify(loginUser)}`)

            AppStorage.setOrCreate('loginUser', loginUser)
            AppStorage.setOrCreate('token', loginUser.token);
            resolve('登陆成功')


          } else {

            resolve('用户名或者密码错误！')
          }


        }


      }).catch((err: Error) => {
        console.error(TAG, `error:${JSON.stringify(err)}`)

        reject(`${err}`);
      })

    })

  }
}