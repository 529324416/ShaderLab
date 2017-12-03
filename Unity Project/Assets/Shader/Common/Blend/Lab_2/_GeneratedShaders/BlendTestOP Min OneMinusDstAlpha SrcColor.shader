Shader "Hidden/Shader/Common/BlendTestOp192"
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
            Blend OneMinusDstAlpha SrcColor
            SetTexture [_SrcTex] { combine texture}
        }
    }
}
