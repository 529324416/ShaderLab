Shader "Hidden/Shader/Common/BlendTestOp134"
{
    Properties {
        _DstTex ("DstTex", 2D) ="white"{}
        _SrcTex ("SrcTex", 2D) ="white"{}
    }
    SubShader {
        Pass{
            SetTexture[_DstTex] {combine texture}
        }
        Pass {
            BlendOp Min
            Blend SrcAlpha DstColor
            SetTexture [_SrcTex] { combine texture}
        }
    }
}
