Shader "Hidden/Shader/Common/BlendTest88" {
    Properties {
        _DstTex ("DstTex", 2D) ="white"{}
        _SrcTex ("SrcTex", 2D) ="white"{}
    }
    SubShader {
        Pass{
            SetTexture[_DstTex] {combine texture}
        }
        Pass {
            Blend OneMinusDstColor OneMinusDstColor
            SetTexture [_SrcTex] { combine texture}
        }
    }
}
