//
//  AuthManager.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/27.
//

import SwiftUI
import FirebaseAuth

final class AuthManager{
    
    var errorMessage: String = ""
    
    func setErrorMessage(_ error:Error?){
        if let error = error as NSError? {
            if let errorCode = AuthErrorCode.Code(rawValue: error.code) {
                switch errorCode {
                case .accountExistsWithDifferentCredential:
                    errorMessage = "0 - アカウントのリンクが必要であることを示します。"
                case .adminRestrictedOperation:
                    errorMessage = "1- 操作が管理者によって制限されていることを示します。"
                case .appNotAuthorized:
                    errorMessage = "2- アプリが提供された API キーで Firebase Authentication を使用する権限がないことを示します。"
                case .appNotVerified:
                    errorMessage = ("3- 電話番号認証中に Firebase でアプリを確認できなかったことを示します。")
                case .appVerificationUserInteractionFailure:
                    errorMessage = ("4- アプリの検証フロー中に一般的なエラーが発生したことを示します。")
                case .captchaCheckFailed:
                    errorMessage = ("5- reCAPTCHA トークンが無効であることを示します。")
                case .credentialAlreadyInUse:
                    errorMessage = ("6- 既に別の Firebase アカウントにリンクされている資格情報にリンクしようとしていることを示します")
                case .customTokenMismatch:
                    errorMessage = ("7- サービス アカウントと API キーが異なるプロジェクトに属していることを示します。")
                case.dynamicLinkNotActivated:
                    errorMessage = ("8- Firebase Dynamic Link がアクティブ化されていないことを示します。")
                case .emailAlreadyInUse:
                    errorMessage = ("9- サインアップの試行に使用された電子メールが既に使用されていることを示します。")
                case .emailChangeNeedsVerification:
                    errorMessage = ("10- 検証済みの電子メールを変更する必要があることを示します。")
                case .expiredActionCode:
                    errorMessage = ("11- OOB コードの有効期限が切れていることを示します。")
                case .gameKitNotLinked:
                    errorMessage = ("12- Game Center サインインを試行する前に、GameKit フレームワークがリンクされていないことを示します。")
                case .internalError:
                    errorMessage = ("13- 内部エラーが発生したことを示します。")
                case .invalidActionCode:
                    errorMessage = ("15- OOB コードが無効であることを示します。")
                case .invalidAPIKey:
                    errorMessage = ("15- リクエストで無効な API キーが指定されたことを示します。")
                case .invalidAppCredential:
                    errorMessage = ("16- verifyClient リクエストで無効な APNS デバイス トークンが使用されたことを示します。")
                case .invalidClientID:
                    errorMessage = ("17- Web フローの呼び出しに使用された clientID が無効であることを示します。")
                case .invalidContinueURI:
                    errorMessage = ("18- 続行 URI で指定されたドメインが無効であることを示します。")
                case .invalidCredential:
                    errorMessage = ("19- IDP トークンまたは requestUri が無効であることを示します。")
                case .invalidCustomToken:
                    errorMessage = ("20- カスタム トークンの検証エラーを示します。")
                case .invalidDynamicLinkDomain:
                    errorMessage = ("21- 使用されている Firebase Dynamic Link ドメインが構成されていないか、現在のプロジェクトで許可されていないことを示しています。")
                case .invalidEmail:
                    errorMessage = ("22- 電子メールが無効であることを示します。")
                case.invalidMessagePayload:
                    errorMessage = ("23- 「パスワード リセット メールの送信」試行中に、ペイロードに無効なパラメーターがあることを示します。")
                case .invalidMultiFactorSession:
                    errorMessage = ("24- 多要素セッションが無効であることを示します。")
                case .invalidPhoneNumber:
                    errorMessage = ("25- verifyPhoneNumber:completion: への呼び出しで無効な電話番号が提供されたことを示します。")
                case .invalidProviderID:
                    errorMessage = ("26- Web 操作の指定されたプロバイダー ID が無効な場合のエラー コードを表します。")
                case .invalidRecipientEmail:
                    errorMessage = ("27- 受信者の電子メールが無効であることを示します。")
                case .invalidSender:
                    errorMessage = ("28- 「パスワード リセット メールの送信」試行中に送信者のメールが無効であることを示します。")
                case .invalidUserToken:
                    errorMessage = ("29- ユーザーが保存した認証資格情報が無効であることを示しています。ユーザーは再度サインインする必要があります。")
                case .invalidVerificationCode:
                    errorMessage = ("30- verifyPhoneNumber リクエストで無効な確認コードが使用されたことを示します。")
                case .invalidVerificationID:
                    errorMessage = ("31- verifyPhoneNumber リクエストで無効な検証 ID が使用されたことを示します。")
                case.keychainError:
                    errorMessage = ("32- キーチェーンへのアクセス試行中にエラーが発生したことを示します。")
                case .localPlayerNotAuthenticated:
                    errorMessage = ("33- Game Center サインインを試行する前に、ローカル プレイヤーが認証されなかったことを示します。")
                case .maximumSecondFactorCountExceeded:
                    errorMessage = ("34 - 最大の第 2 要素カウントを超えたことを示します。")
                case .malformedJWT:
                    errorMessage = ("35- JWT が正しく解析できなかった場合に発生します。JWT 解析プロセスのどのステップが失敗したかを示す根本的なエラーが付随する場合があります。")
                case .missingAndroidPackageName:
                    errorMessage = ("36- androidInstallApp フラグが true に設定されている場合、android パッケージ名が欠落していることを示します。")
                case .missingAppCredential:
                    errorMessage = ("37- APNS デバイス トークンが verifyClient 要求にないことを示します。")
                case .missingAppToken:
                    errorMessage = ("38- APNs デバイス トークンを取得できなかったことを示します。アプリがリモート通知を正しく設定していないか、アプリのデリゲート スウィズリングが無効になっている場合、APNs デバイス トークンを FIRAuth に転送できない可能性があります。")
                case.missingContinueURI:
                    errorMessage = ("39- 続行 URI が必要なバックエンドへのリクエストで提供されなかったことを示します。")
                case .missingClientIdentifier:
                    errorMessage = ("40- クライアント識別子が欠落している場合のエラーを示します。")
                case .missingEmail:
                    errorMessage = ("41- メールアドレスが必要でしたが、提供されなかったことを示します。")
                case .missingIosBundleID:
                    errorMessage = ("42- iOS App Store ID が提供されている場合、iOS バンドル ID が欠落していることを示します。")
                case.missingMultiFactorSession:
                    errorMessage = ("43- 多要素セッションが欠落していることを示します。")
                case.missingOrInvalidNonce:
                    errorMessage = ("44- nonce がないか無効であることを示します。")
                case.missingPhoneNumber:
                    errorMessage = ("45- verifyPhoneNumber:completion への呼び出しで電話番号が提供されなかったことを示します。")
                case.missingVerificationCode:
                    errorMessage = ("46- 電話認証資格情報が空の確認コードで作成されたことを示します。")
                case .missingVerificationID:
                    errorMessage = ("47- 電話認証資格情報が空の検証 ID で作成されたことを示します。")
                case.missingMultiFactorInfo:
                    errorMessage = ("48- 多要素情報が欠落していることを示します。")
                case.multiFactorInfoNotFound:
                    errorMessage = ("49- 多要素情報が見つからないことを示します。")
                case .networkError:
                    errorMessage = ("50- ネットワーク エラーが発生したことを示します タイムアウト、中断された接続、到達不能なホストなど。これらのタイプのエラーは、多くの場合、再試行で回復可能です。NSError.userInfo ディクショナリの NSUnderlyingError フィールドには、発生したエラーが含まれます。")
                case.noSuchProvider:
                    errorMessage = ("51- リンクされていないプロバイダーをリンク解除しようとしていることを示します。")
                case.notificationNotForwarded:
                    errorMessage = ("52- アプリが FIRAuth へのリモート通知の転送に失敗したことを示します。")
                case .nullUser:
                    errorMessage = ("53- 操作の引数として null 以外のユーザーが予期されていたが、null ユーザーが指定されたことを示します。")
                case .operationNotAllowed:
                    errorMessage = ("54- 管理者が指定された ID プロバイダーでのサインインを無効にしたことを示します。")
                case .providerAlreadyLinked:
                    errorMessage = ("55- アカウントが既にリンクされているプロバイダをリンクしようとしていることを示します。")
                case .quotaExceeded:
                    errorMessage = ("56- 特定のプロジェクトの SMS メッセージのクォータが超過したことを示します。")
                case.rejectedCredential:
                    errorMessage = ("57- 資格情報が形式に誤りがあるか、または不一致であるため、資格情報が拒否されたことを示します。")
                case .requiresRecentLogin:
                    errorMessage = ("58- ユーザーがサインイン後 5 分以上メールまたはパスワードの変更を試みたことを示します。")
                case .secondFactorAlreadyEnrolled:
                    errorMessage = ("59- 2 番目の要素が既に登録されていることを示します。")
                case .secondFactorRequired:
                    errorMessage = ("60- サインインには 2 番目の要素が必要であることを示します。")
                case .sessionExpired:
                    errorMessage = ("61- SMS コードの有効期限が切れたことを示します。")
                case .tooManyRequests:
                    errorMessage = ("62 - サーバー メソッドに対して行われた要求が多すぎることを示します。")
                case .unauthorizedDomain:
                    errorMessage = ("63- 続行 URL で指定されたドメインが Firebase コンソールでホワイトリストに登録されていないことを示します。")
                case .unsupportedFirstFactor:
                    errorMessage = ("64- 最初の要素がサポートされていないことを示します。")
                case.unverifiedEmail:
                    errorMessage = ("65- 確認のために電子メールが必要であることを示します。")
                case .userDisabled:
                    errorMessage = ("66- サーバー上でユーザーのアカウントが無効になっていることを示します。")
                case.userMismatch:
                    errorMessage = ("67- 現在のユーザーではないユーザーで再認証しようとしたことを示します。")
                case.userNotFound:
                    errorMessage = ("68 - ユーザー アカウントが見つからなかったことを示します。")
                case .userTokenExpired:
                    errorMessage = ("69- 保存されたトークンの有効期限が切れていることを示します。たとえば、ユーザーが別のデバイスでアカウント パスワードを変更した可能性があります。ユーザーは、この要求を行ったデバイスで再度サインインする必要があります。")
                case.weakPassword:
                    errorMessage = ("70 - 弱すぎると考えられるパスワードを設定しようとしていることを示します。")
                case .webContextAlreadyPresented:
                    errorMessage = ("71- 既に提示されている Web コンテキストに対して、新しい Web コンテキストを提示しようとしたことを示します。")
                case .webContextCancelled:
                    errorMessage = ("72- URL 表示がユーザーによって途中でキャンセルされたことを示します。")
                case .webInternalError:
                    errorMessage = ("73- SFSafariViewController または WKWebView 内で内部エラーが発生したことを示します。")
                case .webNetworkRequestFailed:
                    errorMessage = ("74- SFSafariViewController または WKWebView 内のネットワーク要求が失敗したことを示します。")
                case .wrongPassword:
                    errorMessage = ("75 - ユーザーが間違ったパスワードでサインインしようとしたことを示します。")
                case .webSignInUserInteractionFailure:
                    errorMessage = ("76- Web サインイン フロー中の一般的なエラーを示します。")
                default:
                    errorMessage = ("77- 不明なエラーが発生しました")
                }
            }
        }
    }
}
