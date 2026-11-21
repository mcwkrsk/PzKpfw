"""Safe, model-independent assistant protocol for PzKpfw."""

from .executor import AssistantExecutionError, ExecutionResult, execute_plan
from .manual_json import load_plan_file, parse_plan_json
from .models import (
    AssistantOperation,
    AssistantPlan,
    AssistantProtocolError,
    SourceReference,
)
from .assignment import (
    AssignmentInput,
    CALCULATION_LABELS,
    CourseworkAssignment,
    TRANSMISSION_LABELS,
    build_assignment_plan,
    parse_assignment_inputs,
)
from .audit import append_audit_record, build_audit_record, default_audit_path
from .context import model_project_context, summarize_project
from .chatgpt_auth import ChatGPTAuthError, ChatGPTAuthManager
from .providers import (
    CancellationToken,
    HttpJsonTransport,
    ModelPlanRequest,
    ModelPlanResult,
    ModelProvider,
    ModelClarificationRequired,
    ModelProviderError,
    ModelRequestCancelled,
    OpenAIResponsesProvider,
    VerifiedModelPreview,
    generate_model_preview,
)

__all__ = [
    "AssistantExecutionError",
    "AssistantOperation",
    "AssistantPlan",
    "AssistantProtocolError",
    "AssignmentInput",
    "CALCULATION_LABELS",
    "CourseworkAssignment",
    "ExecutionResult",
    "SourceReference",
    "TRANSMISSION_LABELS",
    "build_assignment_plan",
    "append_audit_record",
    "build_audit_record",
    "default_audit_path",
    "execute_plan",
    "load_plan_file",
    "parse_plan_json",
    "parse_assignment_inputs",
    "summarize_project",
    "model_project_context",
    "ChatGPTAuthError",
    "ChatGPTAuthManager",
    "CancellationToken",
    "HttpJsonTransport",
    "ModelPlanRequest",
    "ModelPlanResult",
    "ModelProvider",
    "ModelClarificationRequired",
    "ModelProviderError",
    "ModelRequestCancelled",
    "OpenAIResponsesProvider",
    "VerifiedModelPreview",
    "generate_model_preview",
]
