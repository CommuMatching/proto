//
//  Error.swift
//  proto
//
//  Created by 玉川悠真 on 2023/04/19.
//

import SwiftUI
import FirebaseAuth

func setErrorMessage(_ error:Error?) -> String {
    var errorMessage = ""
    if let error = error as NSError? {
        if let errorCode = AuthErrorCode.Code(rawValue: error.code) {
            switch errorCode {
            case .accountExistsWithDifferentCredential:
                errorMessage = "アカウントのリンクが必要です。"
            case .adminRestrictedOperation:
                errorMessage = "この操作は管理者によって制限されています。"
            case .appNotAuthorized:
                errorMessage = "このアプリは提供されたAPIキーでのFirebase Authentication の使用を許可されていません。"
            case .appNotVerified:
                errorMessage = "電話番号認証中にFirebaseでこのアプリを確認できませんでした。"
            case .appVerificationUserInteractionFailure:
                errorMessage = "このアプリの検証フロー中に一般的なエラーが発生しました。"
            case .captchaCheckFailed:
                errorMessage = "reCAPTCHAトークンが無効です。"
            case .credentialAlreadyInUse:
                errorMessage = "既に別のFirebaseアカウントにリンクされています。"
            case .customTokenMismatch:
                errorMessage = "サービスアカウントとAPIキーが異なるプロジェクトに属しています。"
            case.dynamicLinkNotActivated:
                errorMessage = "Firebase Dynamic Linkがアクティブ化されていません。"
            case .emailAlreadyInUse:
                errorMessage = "このメールアドレスは既に使用されています。"
            case .emailChangeNeedsVerification:
                errorMessage = "メールアドレスを変更してください。"
            case .expiredActionCode:
                errorMessage = "OOBコードの有効期限が切れています。"
            case .gameKitNotLinked:
                errorMessage = "Game Centerサインインを試行する前に、GameKit フレームワークがリンクされていません。"
            case .internalError:
                errorMessage = "内部エラーが発生しました。"
            case .invalidActionCode:
                errorMessage = "OOBコードが無効です。"
            case .invalidAPIKey:
                errorMessage = "無効なAPIキーがリクエストされました。"
            case .invalidAppCredential:
                errorMessage = "verifyClientリクエストで無効なAPNSデバイストークンが使用されました。"
            case .invalidClientID:
                errorMessage = "Webフローの呼び出しに使用されたclientIDが無効です。"
            case .invalidContinueURI:
                errorMessage = "続行URIで指定されたドメインが無効です。"
            case .invalidCredential:
                errorMessage = "IDPトークンまたはrequestUriが無効です。"
            case .invalidCustomToken:
                errorMessage = "カスタムトークンの検証エラーです。"
            case .invalidDynamicLinkDomain:
                errorMessage = "使用されているFirebase Dynamic Linkドメインが構成されていないか、現在のプロジェクトで許可されていません。"
            case .invalidEmail:
                errorMessage = "メールアドレスが無効です。"
            case.invalidMessagePayload:
                errorMessage = "「パスワードリセットメールの送信」試行中に、ペイロードに無効なパラメーターがあります。"
            case .invalidMultiFactorSession:
                errorMessage = "多要素セッションが無効です。"
            case .invalidPhoneNumber:
                errorMessage = "verifyPhoneNumber:completion: への呼び出しで無効な電話番号が提供されました。"
            case .invalidProviderID:
                errorMessage = "Web操作の指定されたプロバイダーIDが無効です。"
            case .invalidRecipientEmail:
                errorMessage = "受信者のメールアドレスが無効です。"
            case .invalidSender:
                errorMessage = "「パスワードリセットメールの送信」試行中に送信者のメールが無効です。"
            case .invalidUserToken:
                errorMessage = "ユーザーが保存した認証資格情報が無効です。再度サインインしてください。"
            case .invalidVerificationCode:
                errorMessage = "verifyPhoneNumberリクエストで無効な確認コードが使用されました。"
            case .invalidVerificationID:
                errorMessage = "verifyPhoneNumberリクエストで無効な検証IDが使用されました。"
            case.keychainError:
                errorMessage = "キーチェーンへのアクセス試行中にエラーが発生しました。"
            case .localPlayerNotAuthenticated:
                errorMessage = "Game Centerサインインを試行する前に、ローカルプレイヤーが認証されませんでした。"
            case .maximumSecondFactorCountExceeded:
                errorMessage = "最大の第2要素カウントを超えました。"
            case .malformedJWT:
                errorMessage = "JWTが正しく解析できませんでした。"
            case .missingAndroidPackageName:
                errorMessage = "android パッケージ名が欠落しています。"
            case .missingAppCredential:
                errorMessage = "APNSデバイストークンがverifyClient要求にありません。"
            case .missingAppToken:
                errorMessage = "APNsデバイストークンを取得できませんでした。アプリがリモート通知を正しく設定していないか、アプリのデリゲートスウィズリングが無効になっている場合、APNsデバイストークンをFIRAuthに転送できない可能性があります。"
            case.missingContinueURI:
                errorMessage = "続行URIが必要なバックエンドへのリクエストで提供されませんでした。"
            case .missingClientIdentifier:
                errorMessage = "クライアント識別子が欠落しています。"
            case .missingEmail:
                errorMessage = "メールアドレスが必要です。"
            case .missingIosBundleID:
                errorMessage = "iOSバンドルIDが欠落しています。"
            case.missingMultiFactorSession:
                errorMessage = "多要素セッションが欠落しています。"
            case.missingOrInvalidNonce:
                errorMessage = "nonceがないか無効です。"
            case.missingPhoneNumber:
                errorMessage = "verifyPhoneNumber:completionへの呼び出しで電話番号が提供されませんでした。"
            case.missingVerificationCode:
                errorMessage = "電話認証資格情報が空の確認コードで作成されました。"
            case .missingVerificationID:
                errorMessage = "電話認証資格情報が空の検証IDで作成されました。"
            case.missingMultiFactorInfo:
                errorMessage = "多要素情報が欠落しています。"
            case.multiFactorInfoNotFound:
                errorMessage = "多要素情報が見つかりませんでした。"
            case .networkError:
                errorMessage = "ネットワークエラーが発生しました。"
            case.noSuchProvider:
                errorMessage = "リンクされていないプロバイダーをリンク解除しようとしています。"
            case.notificationNotForwarded:
                errorMessage = "アプリがFireAuthへのリモート通知の転送に失敗しました。"
            case .nullUser:
                errorMessage = "操作の引数としてnullユーザーが指定されています。"
            case .operationNotAllowed:
                errorMessage = "管理者が指定されたIDプロバイダーでのサインインを無効にしました。"
            case .providerAlreadyLinked:
                errorMessage = "アカウントが既にリンクされているプロバイダをリンクしようとしています。"
            case .quotaExceeded:
                errorMessage = "特定のプロジェクトのSMSメッセージのクォータが超過しました。"
            case.rejectedCredential:
                errorMessage = "資格情報が形式に誤りがあるか、不一致であるため、資格情報が拒否されました。"
            case .requiresRecentLogin:
                errorMessage = "メールアドレスまたはパスワードの変更が5分以上かかっています。"
            case .secondFactorAlreadyEnrolled:
                errorMessage = "2番目の要素が既に登録されています。"
            case .secondFactorRequired:
                errorMessage = "サインインには2番目の要素が必要です。"
            case .sessionExpired:
                errorMessage = "SMSコードの有効期限が切れました。"
            case .tooManyRequests:
                errorMessage = "サーバーメソッドに対して行われた要求が多すぎます。"
            case .unauthorizedDomain:
                errorMessage = "続行URLで指定されたドメインがFirebaseコンソールでホワイトリストに登録されていません。"
            case .unsupportedFirstFactor:
                errorMessage = "最初の要素がサポートされていません。"
            case.unverifiedEmail:
                errorMessage = "確認のためにメールアドレスが必要です。"
            case .userDisabled:
                errorMessage = "サーバー上でユーザーのアカウントが無効になっています。"
            case.userMismatch:
                errorMessage = "現在のユーザーではないユーザーで再認証しようとしています。"
            case.userNotFound:
                errorMessage = "ユーザーアカウントが見つかりませんでした。"
            case .userTokenExpired:
                errorMessage = "保存されたトークンの有効期限が切れています。このデバイスで再度サインインしてください。"
            case.weakPassword:
                errorMessage = "パスワードが弱すぎます。"
            case .webContextAlreadyPresented:
                errorMessage = "既に提示されているWebコンテキストに対して、新しいWebコンテキストを提示しようとしています。"
            case .webContextCancelled:
                errorMessage = "URL表示がユーザーによって途中でキャンセルされました。"
            case .webInternalError:
                errorMessage = "SFSafariViewControllerまたはWKWebView内で内部エラーが発生しました。"
            case .webNetworkRequestFailed:
                errorMessage = "SFSafariViewControllerまたはWKWebView内のネットワーク要求が失敗しました。"
            case .wrongPassword:
                errorMessage = "パスワードが違います。"
            case .webSignInUserInteractionFailure:
                errorMessage = "Webサインインフロー中にエラーが発生しました。"
            default:
                errorMessage = "不明なエラーが発生しました。"
            }
        }
    }
    return errorMessage
}
