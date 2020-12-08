<?php if (!class_exists('CaptchaConfiguration')) { return; }

// BotDetect PHP Captcha configuration options

return [
    // Captcha configuration for example page
    'ExampleCaptcha' => [
        'UserInputID' => 'captchaCode',
        'ImageWidth' => 250,
        'ImageHeight' => 50,
        'HelpLinkMode' => 'Image'
    ],

    // Captcha configuration for contact page
    'ContactCaptcha' => [
        'UserInputID' => 'captchaCode',
        'CodeLength' => CaptchaRandomization::GetRandomCodeLength(4, 6),
        'HelpLinkMode' => 'Image'
    ],

    /*
    |--------------------------------------------------------------------------
    | Captcha configuration for login page
    |--------------------------------------------------------------------------
    */
    'LoginCaptcha' => [
        'UserInputID' => 'captchaCode',
        'CodeLength' => CaptchaRandomization::GetRandomCodeLength(4, 6),
        'HelpLinkMode' => 'Image'
    ],

    /*
    |--------------------------------------------------------------------------
    | Captcha configuration for register page
    |--------------------------------------------------------------------------
    */
    'RegisterCaptcha' => [
        'UserInputID' => 'captchaCode',
        'CodeLength' => CaptchaRandomization::GetRandomCodeLength(4, 7),
        'CodeStyle' => CodeStyle::Alpha,
        'HelpLinkMode' => 'Image'
    ],

    // Add more your Captcha configuration here...

];
