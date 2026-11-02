"""Evidence-first reader, editor, validator and writer for IS-2 project XML."""

__version__ = "0.7.9"
from .model import Action, Link, Project, ProjectFormatError, load_project
from .document import ProjectDocument, ActionRecord, LinkRecord
from .concept import ConceptStructureDocument, SubjectCategory, SCBinaryLink
from .spz import DynamicStructureDocument, AElementRecord, DynamicLinkRecord, ContentLinkRecord
from .compatibility import audit_document
from .history import SnapshotHistory
from .graph import build_relationship_graph, filter_relationship_graph
from .dependencies import dependency_report
from .graph_layout import automatic_relationship_layout
from .view_state import load_view_state, save_view_state, sidecar_path, ViewStateError
from .repair import RepairError, link_integrity_report, apply_link_repairs, available_repair_targets
from .backups import (BackupError, BackupInfo, backup_directory, create_project_backup,
                      inspect_backup, list_project_backups, restore_project_backup, backup_report)
from .diff import (ProjectDiffError, DiffOperation, ProjectDiff, compare_documents,
                   compare_project_files, apply_selected_restores, resolve_locator, format_locator,
                   expand_related_restore_bundle)
from .merge import ProjectMergeError, MergeConflict, merge_documents, merge_project_files
from .graph_diff import compare_relationship_graphs

__all__ = [
    "__version__", "Action", "Link", "Project", "ProjectFormatError", "load_project",
    "ProjectDocument", "ActionRecord", "LinkRecord",
    "ConceptStructureDocument", "SubjectCategory", "SCBinaryLink",
    "SnapshotHistory", "audit_document",
    "DynamicStructureDocument", "AElementRecord", "DynamicLinkRecord", "ContentLinkRecord",
    "build_relationship_graph", "filter_relationship_graph", "dependency_report",
    "automatic_relationship_layout", "load_view_state", "save_view_state", "sidecar_path", "ViewStateError",
    "RepairError", "link_integrity_report", "apply_link_repairs", "available_repair_targets",
    "BackupError", "BackupInfo", "backup_directory", "create_project_backup",
    "inspect_backup", "list_project_backups", "restore_project_backup", "backup_report",
    "ProjectDiffError", "DiffOperation", "ProjectDiff", "compare_documents",
    "compare_project_files", "apply_selected_restores", "resolve_locator", "format_locator",
    "expand_related_restore_bundle", "ProjectMergeError", "MergeConflict",
    "merge_documents", "merge_project_files", "compare_relationship_graphs",
]
