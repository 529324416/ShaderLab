Shader "Hidden/Shader/Common/BlendTest87" {
    Properties {
        _DstTex ("DstTex", 2D) ="white"{}
        _SrcTex ("SrcTex", 2D) ="white"{}
    }
    SubShader {
        Pass{
            SetTexture[_DstTex] {combine texture}
        }
        Pass {
            Blend OneMinusDstColor OneMinusSrcAlpha
            SetTexture [_SrcTex] { combine texture}
        }
    }
}
